<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- BAY관리 -->
<div id="resizableContainer">
    <div class="content">
        <section class="group">
            <div class="header_area">
                <div class="btn_left">
                        <button type="button" class="btn_m btn_reset" id="btnInit"><spring:message code="global.btn.init" /></button>
                </div>
                <div class="btn_right">
                    <dms:access viewId="VIEW-D-12034" hasPermission="${dms:getPermissionMask('READ')}">
                        <button type="button" class="btn_m btn_search" id="btnSearch"><spring:message code="global.btn.search" /></button>
                    </dms:access>
                    <dms:access viewId="VIEW-D-12031" hasPermission="${dms:getPermissionMask('READ')}">
                        <button type="button" class="btn_m btn_m_min5" id="btnSave"><spring:message code="global.btn.confirm" /></button>
                    </dms:access>
                    <dms:access viewId="VIEW-D-12033" hasPermission="${dms:getPermissionMask('READ')}">
                        <button type="button" class="btn_m btn_add btn_m_min5" id="btnAdd"><spring:message code="global.btn.add" /></button>
                    </dms:access>
                    <dms:access viewId="VIEW-D-12032" hasPermission="${dms:getPermissionMask('READ')}">
                        <button type="button" class="btn_m btn_del btn_m_min5" id="btnDel"><spring:message code="global.btn.del" /></button>
                    </dms:access>
                </div>
            </div>
            <div id="tabstrip" class="tab_area">
                <!-- 탭메뉴 -->
                <ul>
                    <li id="BAY01" class="k-state-active"><spring:message code="global.title.bayMng" /><!-- BAY관리 --></li>
                    <li id="BAY02"><spring:message code="ser.lbl.bayCalendar" /><!-- BAY일정 --></li>
                </ul>
                <!-- //탭메뉴 -->

                <div>
                    <!-- 조회 조건 시작 -->
                    <div class="table_form form_width_40per" role="search" data-btnid="btnSearch">
                        <table>
                            <caption></caption>
                            <colgroup>
                                <col style="width:10%;">
                                <col style="width:15%;">
                                <col style="width:10%;">
                                <col style="width:15%;">
                                <col style="width:10%;">
                                <col style="width:10%;">
                                <col style="width:10%;">
                                <col style="width:20%;">
                            </colgroup>
                            <tbody>
                                <tr>
                                    <th scope="row"><spring:message code="ser.lbl.bayNo" /><!-- BAY NO --></th>
                                    <td>
                                        <input type="text" id="sBayNo" class="form_input" maxlength="10"/>
                                    </td>
                                    <th scope="row"><spring:message code="ser.lbl.bayNm" /><%-- BAY 명칭 --%></th>
                                    <td>
                                        <input type="text" id="sBayNm" class="form_input" />
                                    </td>
                                    <th scope="row"><spring:message code='ser.lbl.bayStatCd' /></th> <!-- BAY 상태 -->
                                    <td>
                                        <input type="text" id="sBayStatCd" class="form_comboBox" />
                                    </td>
                                    <th scope="row"><spring:message code='ser.lbl.lbrTp' /></th> <!-- 수리유형 -->
                                    <td>
                                        <input type="sRpirTp" id="sRpirTp" class="form_comboBox" />
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <!-- 조회 조건 종료 -->

                    <!-- Grid 시작 -->
                    <div class="table_grid mt10">
                        <div id="gridMaster"></div>
                    </div>
                    <!-- Grid 종료-->

                    <!-- Bay정보 -->
                    <form id="bayManageForm" name="bayManageForm" method="POST" action="/">
                        <input type="hidden" id="bayNo" name="bayNo" />
                    </form>
                    <!-- //Bay정보 -->

                    <!-- 그리드 기능 버튼 시작 -->
                    <div class="header_area">
                        <div class="btn_right">
                            <dms:access viewId="VIEW-D-12028" hasPermission="${dms:getPermissionMask('READ')}">
                                <button type="button" class="btn_s btn_del btn_s_min5" id="btnDetailConfirm" disabled style="display:none"><spring:message code="global.btn.confirm" /></button>
                            </dms:access>
                            <dms:access viewId="VIEW-D-12030" hasPermission="${dms:getPermissionMask('READ')}">
                                <button type="button" class="btn_s btn_add btn_s_min5" id="btnDetailAdd" disabled><spring:message code="global.btn.add" /></button>
                            </dms:access>
                            <dms:access viewId="VIEW-D-12029" hasPermission="${dms:getPermissionMask('READ')}">
                                <button type="button" class="btn_s btn_del btn_s_min5" id="btnDetailDel" disabled><spring:message code="global.btn.del" /></button>
                            </dms:access>
                        </div>
                    </div>
                     <!-- Grid 시작 -->
                    <div class="table_grid">
                        <div id="gridDetail"></div>
                    </div>
                    <!-- Grid 종료-->
                </div>

                <div>
                    <!-- 조회조건 -->
                    <div class="table_form" role="search" data-btnid="btnCalSearch">
                        <table>
                            <caption></caption>
                            <colgroup>
                                <col style="width:10%;">
                                <col style="width:10%;">
                                <col style="width:10%;">
                                <col style="width:10%;">
                                <col style="width:10%;">
                                <col style="width:20%;">
                                <col style="width:10%;">
                                <col style="width:20%;">
                            </colgroup>
                            <tbody>
                                <tr>
                                    <th scope="row"><spring:message code="ser.lbl.bayNo" /></th>
                                    <td>
                                        <input id="sCalBayNo" type="text" class="form_input" maxlength="10">
                                    </td>
                                    <th scope="row"><spring:message code="ser.lbl.bayNm" /><%-- BAY 명칭 --%></th>
                                    <td>
                                        <input type="text" id="sCalBayNm" class="form_input" />
                                    </td>
                                    <th scope="row"><spring:message code="ser.lbl.bayExpDt" /></th><!--  예외일자 -->
                                    <td>
                                        <div class="form_float">
                                            <div class="date_left">
                                                <input type="text" id="sMngFromDt" class="form_datepicker ac" />
                                                <span class="txt_from">~</span>
                                            </div>
                                            <div class="date_right">
                                                <input type="text" id="sMngToDt" class="form_datepicker ac" />
                                            </div>
                                        </div>
                                    </td>
                                    <th scope="row"><spring:message code="ser.lbl.bayExpTm" /></th><!--  예외시간 -->
                                    <td>
                                        <div class="form_float">
                                            <div class="date_left">
                                                <input id="sMngFromHm" name="sMngFromHm" class="form_dateTimePicker" style="width:100%">
                                                <span class="txt_from">~</span>

                                            </div>
                                            <div class="date_right">
                                                <input id="sMngToHm" name="sMngToHm" class="form_dateTimePicker" style="width:100%">
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <!-- //조회조건 -->

                    <div id="kendoBayCalendarForm">
                        <section class="group">
                            <div class="header_area">
                                <h2 class="title_basic"></h2>
                            </div>

                            <!-- //bay Calendar 정보 목록  -->
                            <div class="table_grid">
                                <div id="calGrid" class="resizable_grid"></div>
                            </div>
                        </section>
                    </div>
                    <!-- //bay Calendar 정보 목록 -->

                </div>
            </div>
        </section>
    </div>
</div>
<!-- confirm 팝업 -->
<c:import url="/WEB-INF/jsp/ser/cmm/popup/selectConfirmPopup.jsp" />
<!-- confirm 팝업 -->
<!-- //Bay 관리-->

<!-- script -->
<script type="text/javascript">

var bayManageRegPopupWindow;
var wkgrpSearchPopup;
var tecSearchPopup;
//그리드 선택 Row
var gridSelectedRow = 0;
var selectedYn = false;

//20170508 hg
var isTablet="${isTablet}";
var _selectable;
if(isTablet == true || isTablet == "true"){
    _selectable="row";
}else{
    _selectable="multiple";
}


// 공통코드:수리유형
var rpirTpCdList = [];
<c:forEach var="obj" items="${rpirTpCdList}">
rpirTpCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var rpirTpCdMap = dms.data.arrayToMap(rpirTpCdList, function(obj){return obj.cmmCd;});

//공통코드:BAY상세구분
var bayGrpTpCdList = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
<c:forEach var="obj" items="${bayGrpTpCdList}">
bayGrpTpCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var bayGrpTpCdArr = dms.data.arrayToMap(bayGrpTpCdList, function(obj){return obj.cmmCd;});

//공통코드:BAY상태코드
var bayStatCdList = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
<c:forEach var="obj" items="${bayStatCdList}">
bayStatCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var bayStatCdMap = dms.data.arrayToMap(bayStatCdList, function(obj){return obj.cmmCd;});

//공통코드:사용여부
var useYnList = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
<c:forEach var="obj" items="${userYnList}">
useYnList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var useYnMap = dms.data.arrayToMap(useYnList, function(obj){return obj.cmmCd;});


// 수리유형
setRpirTpCd = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        if(rpirTpCdMap[val] != undefined)
        returnVal = rpirTpCdMap[val].cmmCdNm;
    }
    return returnVal;
};
// BAY상태코드
setBayStatCd = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        if(bayStatCdMap[val] != undefined)
        returnVal = bayStatCdMap[val].cmmCdNm;
    }
    return returnVal;
};
// BAY가상여부
setUseYnCd = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        if(useYnMap[val] != undefined)
        returnVal = useYnMap[val].cmmCdNm;
    }
    return returnVal;
};

$(document).ready(function() {

    userAdd = function(flag,field){
        tecSearchPopup = dms.window.popup({
            windowId:"teckManFnSearchWin"
            ,height:530
            ,title:"<spring:message code='ser.lbl.serviceUserSearch' />"   // 사용자조회
            ,content:{
                url:"<c:url value='/ser/cmm/popup/selectTechManFnPopup.do'/>"
                ,data:{
                    "autoBind":true
                    ,"callbackFunc":function(data){
                        if(data.length > 0)
                        {
                            var grid;

                            if(flag == "H"){
                                grid = $("#gridMaster").data("kendoExtGrid");
                                selectedYn = true;
                                gridSelectedRow = grid.select().index();
                                var selectedVal = grid.dataItem(grid.select());
                                selectedVal.set(eval("field")+"Id",data[0].tecId);
                                selectedVal.set(eval("field")+"Nm",data[0].tecNm);
                            }else{
                                grid = $("#gridDetail").data("kendoExtGrid");
                                selectedYn = true;
                                gridSelectedRow = grid.select().index();
                                var rows = grid.tbody.find("tr");
                                var selectedVal = grid.dataItem(grid.select());
                                var checkVal = true;

                                // 중복값 체크
                                $.each(grid.dataSource._data, function(idx, obj){
                                    if(data[0].tecId == obj.tecId){
                                        checkVal = false;
                                    }
                                });

                                if(checkVal){
                                    selectedVal.set("sysNo",data[0].sysNo);
                                    selectedVal.set("tecId",data[0].tecId);
                                    selectedVal.set("tecNm",data[0].tecNm);
                                    selectedVal.set("tskCd",data[0].tskCd);
                                    selectedVal.set("tskNm",data[0].tskNm);
                                    selectedVal.set("deptCd",data[0].deptCd);
                                    selectedVal.set("deptNm",data[0].deptNm);
                                }
                            }
                        }
                    }
                }
            }
        });
    };

    bayAddPopup = function(){
        bayManageRegPopupWindow = dms.window.popup({
            windowId:"bayManageRegPopupWindow"
           ,width:950
           ,height:500
           ,modal:false
           ,title:"<spring:message code='ser.menu.bayMng' />"   // BAY관리
           ,content:{
               url:"<c:url value='/ser/cmm/popup/selectBayManageRegPopup.do'/>"
               ,data:{
                    "autoBind"    :true
                   ,"callbackFunc":function(data){
                       var gridMaster = $("#gridMaster").data("kendoExtGrid").dataSource;
                        gridMaster.insert(0,{
                            "bayNo":data.bayNo
                           ,"bayNm":data.bayNm
                           ,"admSaId":data.admSaId
                           ,"admSaNm":data.admSaNm
                           ,"bayStatCd":data.bayStatCd
                           ,"vrYn":data.vrYn
                           ,"rpirTp":data.rpirTp
                           ,"eqmCd":data.eqmCd
                           ,"eqmNm":data.eqmNm
                           ,"eqmMtnUsrId":data.eqmMtnUsrId
                           ,"eqmMtnUsrNm":data.eqmMtnUsrNm
                           ,"eqmRegDt":data.eqmRegDt
                           ,"eqmValidStartDt":data.eqmValidStartDt
                           ,"eqmValidEndDt":data.eqmValidEndDt
                           ,"eqmMtnPrid":data.eqmMtnPrid
                           ,"eqmChkDt":data.eqmChkDt
                           ,"remark":data.remark
                       });
                       bayManageRegPopupWindow.close();
                   }
               }
           }
       });
    };

    userAddPopup = function(){
        tecSearchPopup = dms.window.popup({
            windowId:"teckManFnSearchWin"
            ,height:530
            ,title:"<spring:message code='ser.lbl.serviceUserSearch' />"   // 사용자조회
            ,content:{
                url:"<c:url value='/ser/cmm/popup/selectTechManFnPopup.do'/>"
                ,data:{
                    "autoBind":true
                    ,"selectable":"multiple"
                    ,"callbackFunc":function(data){
                        if(data.length > 0)
                        {
                            var gridDetail = $('#gridDetail').data('kendoExtGrid').dataSource;

                            $.each(data, function(idx, data){
                                var checkVal = true;

                                // 중복값 체크
                                $.each(gridDetail._data, function(idx, obj){
                                    if(data.tecId == obj.tecId){
                                        checkVal = false;
                                    }
                                });

                                if(checkVal){
                                    gridDetail.insert(0,{
                                        "sysNo":data.sysNo
                                       ,"tecId":data.tecId
                                       ,"tecNm":data.tecNm
                                       ,"deptCd":data.deptCd
                                       ,"deptNm":data.deptNm
                                       ,"tskCd":data.tskCd
                                       ,"tskNm":data.tskNm
                                       ,"bayNo":$("#bayNo").val()
                                   });
                                }
                            });
                        }
                    }
                }
            }
        });
    };

    var selectedTabId = "BAY01";
    $("#tabstrip").kendoExtTabStrip({
        animation:false
        ,select:function(e){
            selectedTabId = e.item.id;
        }
    });

    // 초기화 버튼.
    $("#btnInit").kendoButton({
        click:function(e){
            // BAY관리탭
            $("#sBayNo").val("");
            $("#sBayNm").val("");
            $("#sBayStatCd").data("kendoExtDropDownList").value("");
            $("#sRpirTp").data("kendoExtDropDownList").value("");

            $("#btnSearch").click();

            // BAY일정탭
            $("#sCalBayNo").val("");
            $("#sCalBayNm").val("");
            $("#sMngFromHm").data("kendoTimePicker").value("");
            $("#sMngToHm").data("kendoTimePicker").value("");

            $("#calGrid").data("kendoExtGrid").dataSource.read();
        }
    });

    // 검색
    $("#btnSearch").kendoButton({
        click:function(e) {

            if(selectedTabId == "BAY01"){
                $("#bayNo").val("");
                gridSelectedRow = 0;
                selectedYn = false;

                $("#btnDetailAdd").data("kendoButton").enable(false);
                $("#btnDetailDel").data("kendoButton").enable(false);
                $("#btnDetailConfirm").data("kendoButton").enable(false);
                $("#gridMaster").data("kendoExtGrid").dataSource.page(1);
                $("#gridDetail").data("kendoExtGrid").dataSource.data([]);
            }else{
                $("#calGrid").data("kendoExtGrid").dataSource.read();
            }
        }
    });

    // 조회조건 :  수리유형
    $("#sRpirTp").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:rpirTpCdList
        ,optionLabel:" "
        ,index:0
    });

    // 수리유형
    $("#rpirTp").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:rpirTpCdList
        ,optionLabel:" "
        ,index:0
    });

    // BAY 상태
    $("#sBayStatCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:bayStatCdList
        ,optionLabel:" "
        ,index:0
    });

    // 김경목 - 추후변경
    // 사용여부
    $("#useYn").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:useYnList
        ,index:1
    });

    // 가상여부
    $("#vrYn").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:useYnList
        ,index:1
    });


    // 초기화
    $("#btnBayInit").kendoButton({
        click:function(e) {
            bayReset();
        }
    });


    getEqmCheckDateTime = function(e){

        var grid = $("#gridMaster").data("kendoExtGrid");
        var selectedVal = grid.dataItem(grid.select());

        var eqmValidStartDt = kendo.parseDate(selectedVal.eqmValidStartDt);
        var eqmValidEndDt = kendo.parseDate(selectedVal.eqmValidEndDt);
        if(eqmValidEndDt == null){
            eqmValidEndDt = eqmValidStartDt;
        }
        var selectId = e.sender.element[0].id;
        if(eqmValidStartDt > eqmValidEndDt ){
           dms.notification.info( "<spring:message code='ser.lbl.eqmValidEndDt' var='eqmValidStartDt' />"+
                                     "<spring:message code='ser.lbl.eqmValidEndDt' var='eqmValidEndDt' />"+
                      "<spring:message code='par.info.itemReqZeroCntMsg' arguments='${eqmValidStartDt},${eqmValidEndDt}' />");
           if(selectId == "eqmValidStartDt") selectedVal.set("eqmValidStartDt","");
           else selectedVal.set("eqmValidEndDt","");
           return;
        }
    };

    // 확인버튼
    $("#btnSave").kendoButton({
        click:function(e) {
            if(selectedTabId == "BAY01"){
                bayGridSave();
            }else{
                calGridSave();
            }
        }
    });


    bayGridSave = function() {
        var gridMaster = $("#gridMaster").data("kendoExtGrid");
        var saveData = gridMaster.getCUDData("insertList", "updateList", "deleteList");

        var gridDetail = $("#gridDetail").data("kendoExtGrid");
        var saveData2 = gridDetail.getCUDData("insertList", "updateList", "deleteList");

        if (gridMaster.cudDataLength == 0 && gridDetail.cudDataLength == 0) {
            dms.notification.info( "<spring:message code='global.info.required.change' />");
            return;
        }
        var result = true;
        $.each(gridMaster.dataSource._data, function(idx, data){


            if(dms.string.strNvl(data.bayNo) == ""){
                msgText = "<spring:message code='ser.lbl.bayNo' var='bayNo' />"+
                "<spring:message code='global.info.required.field' arguments='${bayNo}' />";

                result = false;
                return dms.notification.warning(msgText);;
            }
            if(dms.string.strNvl(data.bayNm) == ""){
                msgText = "<spring:message code='ser.lbl.bayNm' var='bayNm' />"+
                "<spring:message code='global.info.required.field' arguments='${bayNm}' />";

                result = false;
                return dms.notification.warning(msgText);;
            }
            if(dms.string.strNvl(data.admSaNm) == ""){
                msgText = "<spring:message code='ser.lbl.bayMngNm' var='admSaNm' />"+
                "<spring:message code='global.info.required.field' arguments='${admSaNm}' />";

                result = false;
                return dms.notification.warning(msgText);;
            }
            if(dms.string.strNvl(data.bayStatCd) == ""){
                msgText = "<spring:message code='ser.lbl.bayStatCd' var='bayStatCd' />"+
                "<spring:message code='global.info.required.field' arguments='${bayStatCd}' />";

                result = false;
                return dms.notification.warning(msgText);;
            }
        });

        if(!result) return;

        if(gridMaster.gridValidation()) {
            $.ajax({
                url:"<c:url value='/ser/svi/bayManage/saveBayManages.do' />"
                ,data:JSON.stringify({"bayMasterListVO":saveData})
                ,type:'POST'
                ,dataType:'json'
                ,contentType:'application/json'
                ,error:function(jqXHR, status, error){
                    dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                }
                ,success:function(result, textStatus){
                    selectedYn = true;
                    gridSelectedRow = gridMaster.select().index();

                    gridMaster.dataSource.read();

                    $("#btnDetailConfirm").click();
                }
                ,beforeSend:function(xhr){
                    dms.loading.show($("#resizableContainer"));
                }
                ,complete:function(xhr,status){
                    dms.loading.hide($("#resizableContainer"));
                }
            });
        }
    }


    $("#btnAdd").kendoButton({
        click:function(e){
            if(selectedTabId == "BAY01"){
                bayAddPopup();
            }else{
                bayCalendarRegWindow();
            }
        }
    });

    // 삭제
    $("#btnDel").kendoButton({
        click:function(e) {
            if(selectedTabId == "BAY01"){
                bayGridDelete();
            }else{
                calGridDelete();
            }
        }
    });

    bayGridDelete = function() {
        $("#messageId").html("<spring:message code='ser.lbl.del' var='del' />"+
                                "<spring:message code='global.info.cnfrmMsg' arguments='${del}' />");
        conformKendoWindow.content( $(".msgDiv").html());
        conformKendoWindow.open();
        $(".yes, .no").click(function(){
            if($(this).hasClass("yes")){
                $.ajax({
                    url:"<c:url value='/ser/svi/bayManage/deleteBayManage.do' />"
                    ,data:JSON.stringify({bayNo:$("#bayNo").val()})
                    ,type:'POST'
                    ,dataType:'json'
                    ,contentType:'application/json'
                    ,error:function(request,status,error){
                        dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                    }
                   ,success:function(jqXHR, textStatus) {

                       $("#btnSearch").click();
                       dms.notification.success("<spring:message code='global.info.success'/>");
                       //bayReset();
                    }
                    ,beforeSend:function(xhr){
                        dms.loading.show($("#resizableContainer"));
                    }
                    ,complete:function(xhr,status){
                        dms.loading.hide($("#resizableContainer"));
                    }
                });
            }
            conformKendoWindow.close();
       }).end();
    }

    // 디테일 추가
    $("#btnDetailAdd").kendoButton({
        click:function(e) {
            userAddPopup();
         }
    });

     // Detail 저장/수정
    $("#btnDetailConfirm").kendoButton({
        click:function(e) {

            var gridDetail = $("#gridDetail").data("kendoExtGrid");

            var saveData = gridDetail.getCUDData("insertList", "updateList", "deleteList");

            var result = true;
            $.each(gridDetail.dataSource._data, function(idx, data){

                if(dms.string.strNvl(data.tecId) == ""){
                    msgText = "<spring:message code='ser.lbl.staffNo' var='tecId' />"+
                    "<spring:message code='global.info.required.field' arguments='${tecId}' />";

                    result = false;
                    return dms.notification.warning(msgText);;
                }

            });

            if(!result) return;

            if(gridDetail.gridValidation()) {
                $.ajax({
                    url:"<c:url value='/ser/svi/bayManage/saveBayDetails.do' />"
                    ,data:JSON.stringify({"bayManageSaveVO":saveData})
                    ,type:'POST'
                    ,dataType:'json'
                    ,contentType:'application/json'
                    ,error:function(jqXHR, status, error){
                        dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                    }
                    ,success:function(result, textStatus){
                        dms.notification.success("<spring:message code='global.info.success'/>");
                        gridDetail.dataSource.read();
                    }
                    ,beforeSend:function(xhr){
                        dms.loading.show($("#resizableContainer"));
                    }
                    ,complete:function(xhr,status){
                        dms.loading.hide($("#resizableContainer"));
                    }
                });
            }
        }
    });

    // 디테일 삭제
    $("#btnDetailDel").kendoButton({
        click:function(e) {

         var grid = $("#gridDetail").data("kendoExtGrid");
         var rows = grid.select();

         rows.each(function(index, row) {
             grid.removeRow(row);
         });

         }
    });

    // 초기화
    bayReset = function() {

        // Bay번호 추가모드.
        var bayNo = $("#bayNo").prop("disabled", false);

        // 수리유형.
        var rpirTp = $("#rpirTp").data("kendoExtDropDownList");
        rpirTp.select(0);

        // Bay구분.
        var bayTp = $("#bayTp").data("kendoExtDropDownList")
        bayTp.select(0);

        // 사용여부.
        var useYn = $("#useYn").data("kendoExtDropDownList")
        useYn.select(0);

        // 가상여부.
        var vrYn = $("#vrYn").data("kendoExtDropDownList")
        vrYn.select(0);

        $("#bayNo").val("");
        $("#bayNm").val("");
        $("#admSaNm").val("");

        var gridMaster = $("#gridMaster").data("kendoExtGrid");
        gridMaster.dataSource.read();

        // 기술자 상세 리스트 초기화.
        $("#gridDetail").data("kendoExtGrid").dataSource.data([]);
    }



    $("#gridMaster").kendoExtGrid({
        gridId:"G-SER-1011-000104"
        ,dataSource:{
            transport:{
                read:{
                     url:"<c:url value='/ser/svi/bayManage/selectBayManages.do' />"
                }
                ,parameterMap:function(options, operation)
                {
                    if (operation === "read") {

                        var params = {};

                        params["sBayNo"]     = $("#sBayNo").val();
                        params["sBayNm"]     = $("#sBayNm").val();
                        params["sBayStatCd"] = $("#sBayStatCd").data("kendoExtDropDownList").value();
                        params["sRpirTp"]    = $("#sRpirTp").data("kendoExtDropDownList").value();

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
                       ,bayNo:{ type:"string" ,validation:{required:true}}
                       ,bayNm:{ type:"string" ,validation:{required:true}}
                       ,admSaNm:{ type:"string" ,validation:{required:true}}
                       ,bayStatCd:{ type:"string" ,validation:{required:true}}
                       ,regDt:{ type:"date", editable:false }
                       ,eqmCd:{ type:"string" }
                       ,eqmRegDt:{ type:"date", editable:false }
                       ,eqmValidStartDt:{ type:"date" }
                       ,eqmValidEndDt:{ type:"date" }
                       ,eqmChkDt:{ type:"date", editable:false }
                  }
               }
            }
        }
        ,height:250
        ,editable:true
        ,editable:{
            confirmation:false
        }
        ,pageable:false
        ,sortable:false
        ,selectable:"row"
        ,filterable:false                 // 필터링 기능 사용안함
        ,dataBound:function(e) {
            if(selectedYn ){
                e.sender.select(e.sender.tbody.find("tr")[gridSelectedRow]);
            }
        }
        ,edit:function(e){

            var selectedVal = this.dataItem(this.select());

            var fieldName = $(e.container.find("input")[1]).attr("name");
            var fieldName2 = $(e.container.find("input")[0]).attr("name");
            if(selectedVal != null){
                if(selectedVal.rnum != undefined){
                    if(fieldName2 == "bayNo" || fieldName2 == "bayNm"){
                        this.closeCell();
                    }
                }
            }
        }
        ,change:function(e) {

            if(!e.sender.dataItem(e.sender.select()).isNew()){

                var selectedVal = this.dataItem(this.select());
                var bayNo = selectedVal.bayNo;
                var dlrCd = selectedVal.dlrCd;

                $("#bayNo").val(bayNo);
                $.ajax({
                    url:"<c:url value='/ser/svi/bayManage/selectBayMasterByKey.do' />"
                    ,data:JSON.stringify({sBayNo:bayNo, sDlrCd:dlrCd})
                    ,type:"POST"
                    ,dataType:"json"
                    ,contentType:"application/json"
                    ,error:function(request,status,error){
                        dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                    }
                    ,success:function (result){

                        $("#btnDetailAdd").data("kendoButton").enable(true);
                        $("#btnDetailDel").data("kendoButton").enable(true);
                        $("#btnDetailConfirm").data("kendoButton").enable(true);

                        var gridDetail = $("#gridDetail").data("kendoExtGrid");
                        gridDetail.dataSource.read();

                    }

                });
            };
        }
        ,columns:[

             {field:"rnum", title:"<spring:message code='ser.lbl.bayNo' />", width:60,hidden:true}
            ,{field:"bayNo", title:"<spring:message code='ser.lbl.bayNo' />", width:100
                ,attributes:{"class":"al"}
                ,editor:function(container, options){
                    $('<input required type="text" id="bayNo" name="bayNo" maxLength="10" data-bind="value:' + options.field + '" class="form_input" />')
                    .appendTo(container)
                    $('<span class="k-invalid-msg" data-for="bayNo"></span>')
                    .appendTo(container);
                }
            } // bay 번호
            ,{field:"bayNm", title:"<spring:message code='ser.lbl.bayNm' />", width:100
                ,attributes:{"class":"al"}
                ,editor:function(container, options){
                    $('<input required type="text" id="bayNm" name="bayNm" maxLength="100" data-bind="value:' + options.field + '" class="form_input" />')
                    .appendTo(container)
                    $('<span class="k-invalid-msg" data-for="bayNm"></span>')
                    .appendTo(container);
                }
            } //bay 명
            ,{field:"admSaId", title:"<spring:message code='ser.lbl.bayMngNm' />", width:100, hidden:true} // bay 관리자 ID
            ,{field:"admSaNm", title:"<spring:message code='ser.lbl.bayMngNm' />", width:100
                ,attributes:{"class":"al"}
                ,editor:function(container, options) {
                    $('<div class="form_search"><input required type="text" name="admSaNm" data-name="<spring:message code='ser.lbl.bayMngNm'/>" class="form_input" readonly="true" /><a href="#" onclick="userAdd(\'H\',\'admSa\')" >&nbsp;</a></div>')
                    .appendTo(container);
                    $('<span class="k-invalid-msg" data-for="admSaNm"></span>')
                    .appendTo(container);
                 }
            } //bay 관리자
            ,{field:"bayStatCd", title:"<spring:message code='ser.lbl.bayStatCd' />", width:100
                ,attributes:{"class":"ac"}
                ,template:"#=setBayStatCd(bayStatCd)#"
                ,editor:function(container, options){
                    $('<input required name="bayStatCd" data-bind="value:' + options.field + '"/>')
                    .appendTo(container)
                    .kendoExtDropDownList({
                        dataTextField:"cmmCdNm"
                        ,dataValueField:"cmmCd"
                        ,dataSource:bayStatCdList
                        ,change:function(){
                            var selectVal = this.value();
                        }
                    });
                }
             } //BAY 상태
            ,{field:"vrYn", title:"<spring:message code='ser.lbl.resvBay' />", width:100
                ,attributes:{"class":"ac"}
                ,template:"#=setUseYnCd(vrYn)#"
                ,editor:function(container, options){
                    $('<input name="vrYn" data-bind="value:' + options.field + '"/>')
                    .appendTo(container)
                    .kendoExtDropDownList({
                        dataTextField:"cmmCdNm"
                        ,dataValueField:"cmmCd"
                        ,dataSource:useYnList
                    });
                }
             } //예약BAY
            ,{field:"rpirTp", title:"<spring:message code='ser.lbl.lbrTp' />", width:100
                ,attributes:{"class":"ac"}
                ,template:"#=setRpirTpCd(rpirTp)#"
                ,editor:function(container, options){
                    $('<input name="rpirTp" data-bind="value:' + options.field + '"/>')
                    .appendTo(container)
                    .kendoExtDropDownList({
                        dataTextField:"cmmCdNm"
                        ,dataValueField:"cmmCd"
                        ,dataSource:rpirTpCdList
                        ,optionLabel:" "
                        ,valuePrimitive:true
                    });
                }
             } //수리유형
            ,{field:"regDt", title:"<spring:message code='ser.lbl.bayRegDt' />", width:130
                ,attributes:{"class":"ac"}
                ,format:"{0:<dms:configValue code='dateFormat' /> HH:mm}"
            } //BAY생성시간
            ,{field:"eqmCd", title:"<spring:message code='ser.lbl.eqmCd' />", width:100
                ,attributes:{"class":"al"}
                ,editor:function(container, options){
                    $('<input type="text" id="eqmCd" name="eqmCd" maxLength="10" data-bind="value:' + options.field + '" class="form_input" />')
                    .appendTo(container)
                    $('<span class="k-invalid-msg" data-for="eqmCd"></span>')
                    .appendTo(container);
                }
             } //설비번호
             ,{field:"eqmNm", title:"<spring:message code='ser.lbl.eqmNm' />", width:100
                ,attributes:{"class":"al"}
                ,editor:function(container , options){
                    $('<input type="text" id="eqmNm" name="eqmNm" maxLength="100" data-bind="value:' + options.field + '" class="form_input" />')
                    .appendTo(container);
                    $('<span class="k-invalid-msg" data-for="eqmNm"></span>')
                    .appendTo(container);
                }
             } //설비명칭
            ,{field:"eqmMtnUsrId", title:"<spring:message code='ser.lbl.eqmMtnUsrNm' />", width:100,hidden:true} //설비유지보수자ID
            ,{field:"eqmMtnUsrNm", title:"<spring:message code='ser.lbl.eqmMtnUsrNm' />", width:100
                ,attributes:{"class":"al"}
                ,editor:function(container, options) {
                    $('<div class="form_search"><input type="text" name="eqmMtnUsrNm" data-name="<spring:message code='ser.lbl.eqmMtnUsrNm'/>" class="form_input" readonly="true" /><a href="#" onclick="userAdd(\'H\',\'eqmMtnUsr\')" >&nbsp;</a></div>')
                    .appendTo(container);
                    $('<span class="k-invalid-msg" data-for="eqmMtnUsrNm"></span>')
                    .appendTo(container);
                 }
            } //설비유지보수자명
            ,{field:"eqmRegDt", title:"<spring:message code='ser.lbl.eqmRegDt' />", width:130
                ,attributes:{"class":"ac"}
                ,format:"{0:<dms:configValue code='dateFormat' /> HH:mm}"
                /* ,editor:function (container, options){
                    $('<input type="text" id="eqmRegDt" name="eqmRegDt" data-name="<spring:message code="ser.lbl.eqmRegDt" />" data-bind="value:' + options.field + '"/>')
                    .appendTo(container)
                    .kendoExtMaskedDateTimePicker({
                        format:"{0:<dms:configValue code='dateFormat' /> HH:mm}"
                       ,dateValidMessage:"<spring:message code='ser.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
                       ,value:""
                    });
                    $('<span class="k-invalid-msg" data-for="eqmRegDt"></span>').appendTo(container);
                } */
            } //설비등록시간
            ,{field:"eqmValidStartDt", title:"<spring:message code='ser.lbl.eqmValidStartDt' />", width:130
                ,attributes:{"class":"ac"}
                ,format:"{0:<dms:configValue code='dateFormat' /> HH:mm}"
                ,editor:function (container, options){
                    $('<input type="text" id="eqmValidStartDt" name="eqmValidStartDt" data-name="<spring:message code="ser.lbl.eqmValidStartDt" />" data-bind="value:' + options.field + '"/>')
                    .appendTo(container)
                    .kendoExtMaskedDateTimePicker({
                        format:"{0:<dms:configValue code='dateFormat' /> HH:mm}"
                       ,dateValidMessage:"<spring:message code='ser.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
                       ,value:""
                           ,change:getEqmCheckDateTime
                    });
                    $('<span class="k-invalid-msg" data-for="eqmValidStartDt"></span>').appendTo(container);
                }
                ,hidden:true
            } //유효시작시간
            ,{field:"eqmValidEndDt", title:"<spring:message code='ser.lbl.eqmValidEndDt' />", width:130
                ,attributes:{"class":"ac"}
                ,format:"{0:<dms:configValue code='dateFormat' /> HH:mm}"
                ,editor:function (container, options){
                    $('<input type="text" id="eqmValidEndDt" name="eqmValidEndDt" data-name="<spring:message code="ser.lbl.eqmValidEndDt" />" data-bind="value:' + options.field + '"/>')
                    .appendTo(container)
                    .kendoExtMaskedDateTimePicker({
                        format:"{0:<dms:configValue code='dateFormat' /> HH:mm}"
                       ,dateValidMessage:"<spring:message code='ser.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
                       ,value:""
                       ,change:getEqmCheckDateTime
                    });
                    $('<span class="k-invalid-msg" data-for="eqmValidEndDt"></span>').appendTo(container);
                }
                ,hidden:true
            } //유효종료시간
            ,{field:"eqmMtnPrid", title:"<spring:message code='ser.lbl.eqmMtnPrid' />", width:100} //설비유지보수기간
            ,{field:"eqmChkDt", title:"<spring:message code='ser.lbl.eqmChkDt' />", width:130
                ,attributes:{"class":"ac"}
                ,format:"{0:<dms:configValue code='dateFormat' /> HH:mm}"
                /* ,editor:function (container, options){
                    $('<input type="text" id="eqmChkDt" name="eqmChkDt" data-name="<spring:message code="ser.lbl.eqmChkDt" />" data-bind="value:' + options.field + '"/>')
                    .appendTo(container)
                    .kendoExtMaskedDateTimePicker({
                        format:"{0:<dms:configValue code='dateFormat' /> HH:mm}"
                       ,dateValidMessage:"<spring:message code='ser.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
                       ,value:""
                    });
                    $('<span class="k-invalid-msg" data-for="eqmChkDt"></span>').appendTo(container);
                } */
            } //설비점검시간
            ,{field:"remark", title:"<spring:message code='ser.lbl.bayRemark' />", width:200}
        ]//
    });

    $("#gridDetail").kendoExtGrid({
        gridId:"G-SER-1011-000105"
        ,dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/ser/svi/bayManage/selectBayDetails.do' />"
                    ,dataType:"json"
                    ,type:"POST"
                    ,contentType:"application/json"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};

                        params["sBayNo"] = $("#bayNo").val();

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
                        ,sysNo:{type:"string"}
                        ,bayNo:{type:"string", editable:false}
                        ,lineNo:{type:"string"}
                        ,tecId:{type:"string" , validation:{required:true}}
                        ,tecNm:{type:"string" }
                        ,updtDt:{type:"date"}
                    }
                }
            }
        }
        ,height:300
        ,pageable:false
        ,sortable:false
        ,autoBind:false
        ,editable:true
        ,selectable:_selectable
        ,editable:{
            confirmation:false
        }
        ,filterable:false                 // 필터링 기능 사용안함
        ,edit:function(e){

            var selectedVal = this.dataItem(this.select());
            var fieldName2 = $(e.container.find("input")[0]).attr("name");

            if(selectedVal != null){
                if(fieldName2 != "tecId"){
                    this.closeCell();
                }
            }

        }
        ,columns:[
             {field:"sysNo", title:"<spring:message code='ser.lbl.staffNo' />", width:100, attributes:{"class":"al"}} // 시스템번호
            ,{field:"tecId", title:"<spring:message code='ser.lbl.systemId' />", width:100
                ,attributes:{"class":"al"}
                ,editor:function(container, options) {
                    $('<div class="form_search"><input required type="text" name="tecId" data-name="<spring:message code='ser.lbl.staffNo'/>" class="form_input" readonly="true" /><a href="#" onclick="userAdd(\'D\')" >&nbsp;</a></div>')
                    .appendTo(container);
                    $('<span class="k-invalid-msg" data-for="tecId"></span>')
                    .appendTo(container);
                 }
             }                     // 직원번호
            ,{field:"tecNm", title:"<spring:message code='ser.lbl.empNm' />", width:150}                       // 직원이름
            ,{field:"sexCd", title:"<spring:message code='ser.lbl.userSex' />", width:80}                      // 직원성별
            ,{field:"deptCd", title:"<spring:message code='ser.lbl.deptCd' />", width:150}                     // 부서코드
            ,{field:"deptNm", title:"<spring:message code='ser.lbl.deptNm' />", width:150}                     // 부서코드
            ,{field:"tskCd", title:"<spring:message code='ser.lbl.tskCd' />", width:150}                       // 직무코드
            ,{field:"tskNm", title:"<spring:message code='ser.lbl.tskNm' />", width:150}                       // 직무명칭
            ,{field:"bayNo", hidden:true}                       // 직무명칭
        ]
    });



/*#################################################################################
       Bay 일정
###################################################################################  */

    /**조회조건 예외 시작일자 **/
    $("#sMngFromDt").kendoExtMaskedDatePicker({
        format: "<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='ser.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,value:"${sMngFromDt}"
    });

   /**조회조건 예외 종료일자**/
    $("#sMngToDt").kendoExtMaskedDatePicker({
        format: "<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='ser.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,value:"${sMngToDt}"
    });

    $("#sMngFromHm").kendoTimePicker({
        format:"HH:mm"
    });

    $("#sMngToHm").kendoTimePicker({
        format:"HH:mm"
    });

    // 저장
    calGridSave = function() {
        var grid = $("#calGrid").data("kendoExtGrid");
        var saveData = grid.getCUDData("insertList", "updateList", "deleteList");

        if (grid.cudDataLength == 0) {
            dms.notification.info( "<spring:message code='global.info.required.change' />");
            return;
        }

        if (grid.gridValidation()) {
            $.ajax({
                url:"<c:url value='/ser/svi/bayManage/multiBayCalendars.do' />",
                data:JSON.stringify(saveData),
                type:'POST',
                dataType:'json',
                contentType:'application/json',
                error:function(jqXHR,status,error) {
                    dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                },
                success:function(jqXHR, textStatus) {
                    grid.dataSource.read();
                    dms.notification.success("<spring:message code='global.info.success' />");
                }
                ,beforeSend:function(xhr){
                    dms.loading.show($("#resizableContainer"));
                }
                ,complete:function(xhr,status){
                    dms.loading.hide($("#resizableContainer"));
                }
            });
        }else{
            dms.notification.warning("<spring:message code='global.info.check.input' />");
        }
    }

    // 삭제
    calGridDelete = function() {
        var grid = $("#calGrid").data("kendoExtGrid");
        var rows = grid.select();

        rows.each(function(index, row) {
            grid.removeRow(row);
        });
    }

    $("#calGrid").kendoExtGrid({
        gridId:"G-SER-1011-000106"
        ,dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/ser/svi/bayManage/selectBayCalendarMains.do' />"
                }//read
                ,parameterMap:function(options , operation){

                    if(operation == "read"){

                     // 검색 조건을 파라미터로 담는다.
                        var params = {};

                        params["sMngFromDt"] = $("#sMngFromDt").data("kendoExtMaskedDatePicker").value();
                        params["sMngToDt"]   = $("#sMngToDt").data("kendoExtMaskedDatePicker").value();
                        params["sMngFromHm"] = $("#sMngFromHm").val();
                        params["sMngToHm"]   = $("#sMngToHm").val();
                        params["sBayNo"]     = $("#sCalBayNo").val();
                        params["sBayNm"]     = $("#sCalBayNm").val();

                        return kendo.stringify(params);

                    }else if(operation != "read" && options.models){
                        return kendo.stringify(options.models);
                    }
                } //parameterMap
            }//transport
            ,schema:{
                model:{
                    id:"seq"
                   ,fields:{
                      seq:{type:"number"}
                      ,mngDt:{type:"date", validation:{required:true}}
                      ,dlrCd:{type:"string"}
                      ,bayNo:{type:"string" , validation:{required:true}}
                      ,bayNm:{type:"string", editable:false}
                      ,excpStartDt:{type:"date" , validation:{required:true}}
                      ,excpEndDt:{type:"date" , validation:{required:true}}
                      ,remark:{type:"string"}
                   } //fields
                }//model
            }//schema
        }//dataSource
       ,multiSelectWithCheckbox:true
       ,filterable:false                 // 필터링 기능 사용안함
       ,height:300
       ,autoBind:true
       ,scrollable:true
       ,sortable:false
       ,resizable:true
       ,selectable:_selectable
       ,columns:[
           {field:"seq", title:"<spring:message code='ser.lbl.no' />", width:60, hidden:true}
          ,{field:"mngDt", title:"<spring:message code='ser.lbl.bayExpDt' />", width:60, sortable:false, attributes:{"class":"ac"}
              ,format:"{0:<dms:configValue code='dateFormat' />}"
              ,editor:function (container, options){
                  $('<input required name="mngDt" id="mngDt" data-name="<spring:message code='ser.lbl.mngDt' />" data-bind="value:' + options.field + '"/>')
                  .appendTo(container)
                  .kendoExtMaskedDatePicker({
                      format:"<dms:configValue code='dateFormat' />"
                     ,dateValidMessage:"<spring:message code='ser.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
                  });
                  $('<span class="k-invalid-msg" data-for="mngDt"></span>').appendTo(container);
              }
           }
          ,{field:"dlrCd", title:"<spring:message code='ser.lbl.dlrCd' />", width:60, sortable:false, hidden:true, attributes:{"class":"ac"}}
          ,{field:"bayNo", title:"<spring:message code='ser.lbl.bayNo' />", width:80, sortable:false, attributes:{"class":"al"}
              ,editor:function(container, options) {
                $('<div class="form_search"><input type="text" name="bayNo" data-name="<spring:message code='ser.lbl.bayNo' />" class="form_input" readonly="true" /><a href="#" onclick="bayCalendarWindow()" >&nbsp;</a></div>')
                .appendTo(container);
                $('<span class="k-invalid-msg" data-for="bayNo"></span>')
                .appendTo(container);
             }
           }
          ,{field:"bayNm", title:"<spring:message code='ser.lbl.bayNm' />", width:150, sortable:false, attributes:{"class":"al"}}
          ,{field:"excpStartDt", title:"<spring:message code='ser.lbl.excpStartDt' />", width:60, sortable:false, attributes:{"class":"ac"}
              ,format:"{0:HH:mm}"
              ,editor:function (container, options){
                  $('<input required name="excpStartDt" id="excpStartDt" data-name="<spring:message code='ser.lbl.excpStartDt' />"  maxlength="4" data-bind="value:' + options.field + '"/>')
                  .appendTo(container)
                  .kendoTimePicker({
                      format:"HH:mm"
                     ,change:getCheckTime
                  })
                  .kendoMaskedTextBox({
                      mask:"##:##"
                  });
                  $('<span class="k-invalid-msg" data-for="excpStartDt"></span>').appendTo(container);
              }
           }
          ,{field:"excpEndDt", title:"<spring:message code='ser.lbl.excpEndDt' />", width:60, sortable:false, attributes:{"class":"ac"}
              ,format:"{0:HH:mm}"
              ,editor:function (container, options){
                  $('<input required name="excpEndDt" id="excpEndDt" maxlength="4" data-name="<spring:message code='ser.lbl.excpEndDt' />" data-bind="value:' + options.field + '"/>')
                  .appendTo(container)
                  .kendoTimePicker({
                      format:"HH:mm"
                      ,change:getCheckTime
                   })
                  .kendoMaskedTextBox({
                      mask:"##:##"
                  });
                  $('<span class="k-invalid-msg" data-for="excpEndDt"></span>').appendTo(container);
                 }
           }
          ,{field:"remark", title:"<spring:message code='ser.lbl.bayCalRemark' />", width:200, sortable:false, attributes:{"class":"al"}}
         ]
    });

     getCheckTime = function(e){
        var grid = $("#calGrid").data("kendoExtGrid");
        var selectedVal = grid.dataItem(grid.select());
        var excpStartDt = kendo.parseDate(selectedVal.excpStartDt);
        var excpEndDt = kendo.parseDate(selectedVal.excpEndDt);
        if(excpEndDt == null){
            excpEndDt = excpStartDt;
        }
        var selectId = e.sender.element[0].id;
        if(excpStartDt > excpEndDt ){
           dms.notification.info( "<spring:message code='ser.lbl.excpStartHm' var='excpStart' />"+
                                     "<spring:message code='ser.lbl.excpEndHm' var='excpEnd' />"+
                      "<spring:message code='par.info.itemReqZeroCntMsg' arguments='${excpEnd},${excpStart}' />");
           if(selectId == "excpStartDt") selectedVal.set("excpStartDt","");
           else selectedVal.set("excpEndDt","");
           return;
        }
    };
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

                        $("#admSaId").val(jsonObj[0].tecId);
                        $("#admSaNm").val(jsonObj[0].tecNm);
                    }
                }
            }
        }
    });
}

var bayManagePopup;
function bayCalendarRegWindow(){
    bayManagePopup = dms.window.popup({
        windowId:"teckManFnSearchWin"
            , title:"<spring:message code='ser.title.baySearch' />"   // BAY 조회
            , content:{
                url:"<c:url value='/ser/cmm/popup/selectBayManagePopup.do'/>"
                , data:{
                    "autoBind":true
                    , "callbackFunc":function(jsonObj) {
                        if(jsonObj.length > 0) {
                            var gridData = $("#calGrid").data("kendoExtGrid").dataSource;

                            gridData.insert(0,{
                                mngDt:new Date("${sysdate}")
                                ,"dlrCd":$("#sDlrCd").val()
                                ,"bayNo":jsonObj[0].bayNo
                                ,"bayNm":jsonObj[0].bayNm
                                //,"dirty":true
                            });
                        }
                    }
                }
            }

    });
}

function bayCalendarWindow(){
    bayManagePopup = dms.window.popup({
        windowId:"teckManFnSearchWin"
            , title:"<spring:message code='ser.title.baySearch' />"   // BAY 조회
            , content:{
                url:"<c:url value='/ser/cmm/popup/selectBayManagePopup.do'/>"
                , data:{
                    "autoBind":true
                    , "callbackFunc":function(jsonObj) {

                        if(jsonObj.length > 0) {

                            var rows = $("#calGrid").data("kendoExtGrid").tbody.find("tr");
                            rows.each(function(index, row) {
                                var dataItem = $("#calGrid").data("kendoExtGrid").dataSource._data;
                                if($(this).hasClass("k-state-selected")){
                                    dataItem[index].bayNo = jsonObj[0].bayNo;
                                    dataItem[index].bayNm = jsonObj[0].bayNm;
                                    dataItem[index].dirty = true;
                                }
                            });

                            $("#calGrid").data("kendoExtGrid").refresh();
                        }
                    }
                }
            }

    });
}
</script>
<!-- //script -->



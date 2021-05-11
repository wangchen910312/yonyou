<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<!--  //khskhs  문제시 삭제 -->
<%@ page import="org.springframework.mobile.device.Device" %>
<%@ page import="org.springframework.mobile.device.DeviceUtils" %>
<c:set var="isTablet" value="<%=DeviceUtils.getCurrentDevice(request).isTablet()|| DeviceUtils.getCurrentDevice(request).isMobile()%>" />
<!-- //khskhs  문제시 삭제 -->

<!-- 소조관리 -->
<div id="resizableContainer">
    <div class="content">
        <section class="group">
            <div class="header_area">
                <div class="btn_left">
                    <dms:access viewId="VIEW-D-12951" hasPermission="${dms:getPermissionMask('READ')}">
                        <button type="button" class="btn_m btn_reset" id="btnInit"><spring:message code="global.btn.init" /></button>
                    </dms:access>
                </div>
                <div class="btn_right">
                    <dms:access viewId="VIEW-D-12042" hasPermission="${dms:getPermissionMask('READ')}">
                        <button type="button" id="btnSearch" class="btn_m btn_search"><spring:message code="global.btn.search" /></button>
                    </dms:access>
                    <dms:access viewId="VIEW-D-12039" hasPermission="${dms:getPermissionMask('READ')}">
                        <button type="button" id="btnMasterSave" class="btn_m"><spring:message code="global.btn.confirm" /></button>
                    </dms:access>
                    <dms:access viewId="VIEW-D-12041" hasPermission="${dms:getPermissionMask('READ')}">
                        <button type="button" class="btn_m btn_add btn_m_min5" id="btnMasterAdd"><spring:message code="global.btn.add" /></button>
                    </dms:access>
                    <dms:access viewId="VIEW-D-12040" hasPermission="${dms:getPermissionMask('READ')}">
                        <button type="button" class="btn_m btn_del btn_m_min5" id="btnMasterDel"><spring:message code="global.btn.del" /></button>
                    </dms:access>
                </div>
            </div>
            <!-- 조회 조건 시작 -->
            <form id="searchForm">
            <div class="table_form" role="search" data-btnid="btnSearch">
                <table  >
                    <caption></caption>
                    <colgroup>
                        <col style="width:10%;">
                        <col style="width:14%;">
                        <col style="width:10%;">
                        <col style="width:14%;">
                        <col style="width:10%;">
                        <col style="width:14%;">
                        <col style="width:10%;">
                        <col style="width:14%;">
                    </colgroup>
                    <tbody>
                        <tr>
                            <th scope="row"><spring:message code="ser.lbl.wrkTeamNo" /><!-- 반조번호 --></th>
                            <td>
                                <input type="text" id="sWkgrpNo" class="form_input" maxlength="10"/>
                            </td>
                            <th scope="row"><spring:message code="ser.lbl.wrkTeamNm" /><!-- 반조명칭 --></th>
                            <td>
                                <input type="text" id="sWkgrpNm" class="form_input" maxlength="10"/>
                            </td>
                            <th scope="row"><spring:message code="ser.lbl.wrkgrpStat" /><%-- 반조상태 --%></th>
                            <td>
                                <input type="text" id="sWkgrpStatCd" class="form_comboBox" />
                            </td>
                            <th scope="row"><spring:message code="ser.lbl.mngSaNm" /><%-- 반조관리자 --%></th>
                            <td>
                                <div class="form_search">
                                    <input type="text" id="sMngSaNm" class="form_input" />
                                    <a href="javascript:userAdd('S','sMngSa');"></a>
                                </div>
                            </td>
                    </tbody>
                </table>
            </div>
            <!-- 조회 조건 종료 -->

            <!-- 그리드 기능 버튼 시작 -->
             <!-- Grid 시작 -->
            <div class="table_grid mt10">
                <div id="gridMaster"></div>
            </div>
            <!-- Grid 종료-->

            <!-- 그리드 기능 버튼 시작 -->
            <div class="header_area">
                <div class="btn_right">
                    <dms:access viewId="VIEW-D-12036" hasPermission="${dms:getPermissionMask('READ')}">
                        <button type="button" class="btn_s btn_save btn_s_min5" id="btnDetailSave" disabled style="display:none"><spring:message code="global.btn.confirm" /></button>
                    </dms:access>
                    <dms:access viewId="VIEW-D-12038" hasPermission="${dms:getPermissionMask('READ')}">
                        <button type="button" class="btn_s btn_add btn_s_min5" id="btnDetailAdd" disabled><spring:message code="global.btn.add" /></button>
                    </dms:access>
                    <dms:access viewId="VIEW-D-12037" hasPermission="${dms:getPermissionMask('READ')}">
                        <button type="button" class="btn_s btn_del btn_s_min5" id="btnDetailDel" disabled><spring:message code="global.btn.del" /></button>
                    </dms:access>
                </div>
            </div>
             <!-- Grid 시작 -->
            <div class="table_grid">
                <div id="gridDetail" class="resizable_grid"></div>
            </div>
            <!-- Grid 종료-->

            <input id="wkgrpNo" name="wkgrpNo" type="hidden" />
            </form>
        </section>
    </div>
</div>
<!-- //원인 코드마스터 -->
<!-- confirm 팝업 -->
<c:import url="/WEB-INF/jsp/ser/cmm/popup/selectConfirmPopup.jsp" />
<!-- confirm 팝업 -->
<!-- script -->
<script type="text/javascript">

var popupWindow;
var tecSearchPopup;
var workGroupRegPopupWindow;
var gridSelectedRow = 0;
var selectedYn = false;

var wkgrpStatList = [{"cmmCd":"","cmmCdNm":""}];
<c:forEach var="obj" items="${wkgrpStatList}">
wkgrpStatList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var wkgrpStatArr = dms.data.arrayToMap(wkgrpStatList, function(obj){return obj.cmmCd;});

//공통코드:수리유형
var rpirTpCdList = [];
<c:forEach var="obj" items="${rpirTpCdList}">
rpirTpCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var rpirTpCdMap = dms.data.arrayToMap(rpirTpCdList, function(obj){return obj.cmmCd;});

wkgrpStatGrid = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        if(wkgrpStatArr[val] != undefined)
            returnVal = wkgrpStatArr[val].cmmCdNm;
    }
    return returnVal;
};
//수리유형
setRpirTpCd = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        if(rpirTpCdMap[val] != undefined)
        returnVal = rpirTpCdMap[val].cmmCdNm;
    }
    return returnVal;
};

$(document).ready(function() {

    // 검색조건 : 반조상태
    $("#sWkgrpStatCd").kendoExtDropDownList({
        dataSource:wkgrpStatList
        ,dataValueField:"cmmCd"
        ,dataTextField:"cmmCdNm"
        ,index:0
    });

    userAdd = function(flag,field){
        tecSearchPopup = dms.window.popup({
            windowId:"teckManFnSearchWin"
            ,height:530
            ,title:"<spring:message code='cmm.title.user.search' />"   // 사용자조회
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
                            }else if(flag == "S"){
                                $("#sMngSaNm").val(data[0].tecNm);
                            }else{
                                grid = $("#gridDetail").data("kendoExtGrid");
                                selectedYn = true;
                                gridSelectedRow = grid.select().index();
                                var rows = grid.tbody.find("tr");
                                var selectedVal = grid.dataItem(grid.select());

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
        });
    };

    // 초기화 버튼.
    $("#btnInit").kendoButton({
        click:function(e){
            $("#searchForm").get(0).reset();
            $("#btnSearch").click();
        }
    });

    // 검색
    $("#btnSearch").kendoButton({
        click:function(e) {

            $("#gridMaster").data("kendoExtGrid").dataSource.page(1);

            $("#wkgrpNo").val("");

            $("#btnDetailAdd").data("kendoButton").enable(false);
            $("#btnDetailSave").data("kendoButton").enable(false);
            $("#btnDetailDel").data("kendoButton").enable(false);

            $("#gridDetail").data("kendoExtGrid").dataSource.data([]);
            gridSelectedRow = 0;
            selectedYn = false;
        }
    });

    // 마스터 추가
    $("#btnMasterAdd").kendoButton({
        click:function(e) {
            workGroupPopup();
        }
    });

    workGroupPopup = function(){
        workGroupRegPopupWindow = dms.window.popup({
            windowId:"workGroupRegPopupWindow"
           ,width:950
           ,height:500
           ,modal:false
           ,title:"<spring:message code='ser.menu.groupMng' />"   // 반/조관리
           ,content:{
               url:"<c:url value='/ser/cmm/popup/selectWorkGroupRegPopup.do'/>"
               ,data:{
                    "autoBind"    :true
                   ,"callbackFunc":function(data){
                       var gridMaster = $("#gridMaster").data("kendoExtGrid").dataSource;
                        gridMaster.insert(0,{
                             "wkgrpNo":data.wkgrpNo
                            ,"wkgrpNm":data.wkgrpNm
                            ,"rpirTp":data.rpirTp
                            ,"mngSaNm":data.mngSaNm
                            ,"mngSaId":data.mngSaId
                            ,"wkgrpStatCd":data.wkgrpStatCd
                            ,"wkgrpUseDt":data.wkgrpUseDt
                            ,"wkgrpStopDt":data.wkgrpStopDt
                            ,"wkgrpRemark":data.wkgrpRemark
                       });
                        workGroupRegPopupWindow.close();
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
                                       ,"wkgrpNo":$("#wkgrpNo").val()
                                   });
                                }
                            });

                        }
                    }
                }
            }
        });
    };

    // 마스터 저장/수정
    $("#btnMasterSave").kendoButton({
        click:function(e) {

            var masterGrid = $("#gridMaster").data("kendoExtGrid");

            var msgText = "";
            var result = false;
            $.each(masterGrid.dataSource._data, function(idx, obj){
                if( dms.string.isEmpty(obj.wkgrpNo)){
                    msgText = "<spring:message code='ser.lbl.wkgrpNo' var='wkgrpNo' />"+
                                  "<spring:message code='global.info.required.field' arguments='${wkgrpNo}' />";
                    result = true;
                }else if( dms.string.isEmpty(obj.wkgrpNm) ){
                    msgText = "<spring:message code='ser.lbl.dtiInfo' var='dtiInfo' />"+
                                  "<spring:message code='global.info.required.field' arguments='${dtiInfo}' />";
                    result = true;
                }
                return result;
            });

            if(result){
                dms.notification.warning(msgText);
                return;
            }


            var saveData = masterGrid.getCUDData("insertList", "updateList", "deleteList");

            if(masterGrid.gridValidation()) {
                $.ajax({
                    url:"<c:url value='/ser/svi/workGroupManage/multiWorkGroupMasters.do' />"
                    ,data:JSON.stringify({"workGroupMasterListVO":saveData})
                    ,type:'POST'
                    ,dataType:'json'
                    ,contentType:'application/json'
                    ,error:function(request,status,error){
                        dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                    }
                    ,success:function(result, textStatus){
                         var gridMaster = $("#gridMaster").data("kendoExtGrid");
                         selectedYn = true;
                         gridSelectedRow = gridMaster.select().index();

                         gridMaster.dataSource._destroyed = [];
                         gridMaster.dataSource.page(1);

                         $("#btnDetailSave").click();
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

    // 마스터 삭제
    $("#btnMasterDel").kendoButton({
        click:function(e) {

            $("#messageId").html("<spring:message code='ser.lbl.del' var='del' />"+
            "<spring:message code='global.info.cnfrmMsg' arguments='${del}' />");
            conformKendoWindow.content( $(".msgDiv").html());
            conformKendoWindow.open();
            $(".yes, .no").click(function(){

            if($(this).hasClass("yes")){

                $.ajax({
                    url:"<c:url value='/ser/svi/workGroupManage/deleteWorkGroups.do' />"
                    ,data:JSON.stringify({wkgrpNo:$("#wkgrpNo").val()})
                    ,type:'POST'
                    ,dataType:'json'
                    ,contentType:'application/json'
                    ,error:function(request,status,error){
                        dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                    }
                   ,success:function(jqXHR, textStatus) {

                       $("#btnSearch").click();
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
            conformKendoWindow.close();

            }).end();

        }
    });

    //취소버튼
    $("#btnMasterCancel").kendoButton({

        click:function (e){
            var grid = $("#gridMaster").data("kendoExtGrid");
            grid.cancelChanges();
        }

    });

    // 디테일 저장/수정
    $("#btnDetailSave").kendoButton({
        click:function(e) {

            var detailGrid = $("#gridDetail").data("kendoExtGrid");
            var saveData = detailGrid.getCUDData("insertList", "updateList", "deleteList");

            var msgText = "";
            var result = false;
            $.each(detailGrid.dataSource._data, function(idx, obj){
                if( dms.string.isEmpty(obj.sysNo)){
                    msgText = "<spring:message code='ser.lbl.systemId' var='systemId' />"+
                                  "<spring:message code='global.info.required.field' arguments='${systemId}' />";
                    result = true;
                }else if( dms.string.isEmpty(obj.tecId) ){
                    msgText = "<spring:message code='ser.lbl.staffNo' var='staffNo' />"+
                                  "<spring:message code='global.info.required.field' arguments='${staffNo}' />";
                    result = true;
                }
                return result;
            });

            if(result){
                dms.notification.warning(msgText);
                return;
            }

            if(detailGrid.gridValidation()) {
                $.ajax({
                    url:"<c:url value='/ser/svi/workGroupManage/multiWorkGroupDetails.do' />"
                    ,data:JSON.stringify({"workGroupDetailListVO":saveData})
                    ,type:'POST'
                    ,dataType:'json'
                    ,contentType:'application/json'
                    ,error:function(request,status,error){
                        dms.loading.hide($("#resizableContainer"));
                        dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);

                    }
                    ,success:function(result, textStatus){
                        detailGrid.dataSource._destroyed = [];
                        detailGrid.dataSource.page(1);
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

    // 디테일 추가
    $("#btnDetailAdd").kendoButton({
        click:function(e) {
            userAddPopup();
        }
    });



    $("#gridMaster").kendoExtGrid({
        gridId:"G-SER-1011-000140"
        ,dataSource:{
            transport:{
                read:{
                     url:"<c:url value='/ser/svi/workGroupManage/selectWorkGroupManages.do' />"
                }
                ,parameterMap:function(options, operation)
                {
                    if (operation === "read") {

                        var params = {};

                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        params["sWkgrpNo"]     = $("#sWkgrpNo").val();
                        params["sWkgrpNm"]     = $("#sWkgrpNm").val();
                        params["sWkgrpStatCd"] = $("#sWkgrpStatCd").val();
                        params["sMngSaNm"]     = $("#sMngSaNm").val();

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
                       ,wkgrpNo:{ type:"string" }
                       ,wkgrpNm:{ type:"string" }
                       ,mngSaId:{ type:"string" }
                       ,wkgrpUseDt:{ type:"date",editable:false }
                       ,wkgrpStopDt:{ type:"date" }
                       ,wkgrpRemark:{ type:"string" }
                  }
               }
            }
        }
        ,height:300
        ,selectable:"row:single"
        ,pageable:false
        ,filterable:false                 // 필터링 기능 사용안함
        ,resizable:false
        ,sortable:false
        ,dataBound:function(e) {
            if(selectedYn ){
                e.sender.select(e.sender.tbody.find("tr")[gridSelectedRow]);
            }
        }
        ,change:function(e) {

            if(!e.sender.dataItem(e.sender.select()).isNew()){

                var selectedVal = this.dataItem(this.select());

                $("#wkgrpNo").val(selectedVal.wkgrpNo);

                $("#btnDetailAdd").data("kendoButton").enable(true);
                $("#btnDetailSave").data("kendoButton").enable(true);
                $("#btnDetailDel").data("kendoButton").enable(true);

                var gridDetail = $("#gridDetail").data("kendoExtGrid");
                gridDetail.dataSource._destroyed = [];
                gridDetail.dataSource.page(1);

            };
        }
        ,columns:[
             {field:"wkgrpNo", title:"<spring:message code='ser.lbl.wrkTeamNo' />", width:100
                 ,attributes:{"class":"al"}
                 ,editor:function(container , options){
                     $('<input required type="text" id="wkgrpNo" name="wkgrpNo" maxLength="10" data-bind="value:' + options.field + '" class="form_input" />')
                     .appendTo(container);
                     $('<span class="k-invalid-msg" data-for="wkgrpNo"></span>')
                     .appendTo(container);
                 }
             }    // 반조번호
            ,{field:"wkgrpNm", title:"<spring:message code='ser.lbl.wkgrpNo' />", width:100
                ,attributes:{"class":"al"}
                ,editor:function(container , options){
                    $('<input required type="text" id="wkgrpNm" name="wkgrpNm" maxLength="30" data-bind="value:' + options.field + '" class="form_input" />')
                    .appendTo(container);
                    $('<span class="k-invalid-msg" data-for="wkgrpNm"></span>')
                    .appendTo(container);
                }
             }    // 반조명칭
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
            ,{field:"mngSaNm", title:"<spring:message code='ser.lbl.mngSaNm' />", width:100
                ,editor:function(container, options) {
                    $('<div class="form_search"><input type="text" name="mngSaNm" class="form_input" readonly="readonly" /><a href="#" onclick="userAdd(\'H\',\'mngSa\')"></a></div>')
                    .appendTo(container);
                    $('<span class="k-invalid-msg" data-for="mngSaNm"></span>')
                    .appendTo(container);
                }
            }   // 반조관리자
            ,{field:"mngSaId", hidden:true}    // 반조ID
            ,{field:"wkgrpStatCd", title:"<spring:message code='ser.lbl.wrkgrpStat' />", width:100
                ,attributes:{"class":"ac"}
                ,template:"#=wkgrpStatGrid(wkgrpStatCd)#"
                ,editor:function(container, options) {
                    $('<input name="wkgrpStatCd" data-bind="value:' + options.field + '"/>')
                    .appendTo(container)
                    .kendoExtDropDownList({
                        dataValueField:"cmmCd"
                        ,dataTextField:"cmmCdNm"
                        ,valuePrimitive:true
                        ,dataSource:wkgrpStatList
                    });
                }
            }    // 반조상태
            ,{field:"wkgrpUseDt", title:"<spring:message code='ser.lbl.wkgrpUseDt' />", width:130
                ,attributes:{"class":"ac"}
                ,format:"{0:<dms:configValue code='dateFormat' /> HH:mm}"
                /* ,editor:function (container, options){
                    $('<input type="text" id="wkgrpUseDt" name="wkgrpUseDt" data-name="<spring:message code="ser.lbl.wkgrpUseDt" />" data-bind="value:' + options.field + '"/>')
                    .appendTo(container)
                    .kendoExtMaskedDateTimePicker({
                        format:"{0:<dms:configValue code='dateFormat' /> HH:mm}"
                       ,dateValidMessage:"<spring:message code='ser.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
                       ,value:""
                    });
                    $('<span class="k-invalid-msg" data-for="eqmRegDt"></span>').appendTo(container);
                } */
            } //반조사용시간
            ,{field:"wkgrpStopDt", title:"<spring:message code='ser.lbl.wkgrpStopDt' />", width:130
                ,attributes:{"class":"ac"}
                ,format:"{0:<dms:configValue code='dateFormat' /> HH:mm}"
                ,editor:function (container, options){
                    $('<input type="text" id="wkgrpStopDt" name="wkgrpStopDt" data-name="<spring:message code="ser.lbl.wkgrpStopDt" />" data-bind="value:' + options.field + '"/>')
                    .appendTo(container)
                    .kendoExtMaskedDateTimePicker({
                        format:"{0:<dms:configValue code='dateFormat' /> HH:mm}"
                       ,dateValidMessage:"<spring:message code='ser.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
                       ,value:""
                    });
                    $('<span class="k-invalid-msg" data-for="eqmRegDt"></span>').appendTo(container);
                }
                ,hidden:true
            } //반조정지시간
            ,{field:"wkgrpRemark", title:"<spring:message code='ser.lbl.wkgrpRemark' />", width:300
                ,attributes:{"class":"al"}
                ,editor:function(container , options){
                    $('<input type="text" id="wkgrpRemark" name="wkgrpRemark" maxLength="100" data-bind="value:' + options.field + '" class="form_input" />')
                    .appendTo(container);
                    $('<span class="k-invalid-msg" data-for="wkgrpRemark"></span>')
                    .appendTo(container);
                }
             } //설비명칭
        ]
    });

    $("#gridDetail").kendoExtGrid({
        gridId:"G-SER-1011-000141"
        ,dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/ser/svi/workGroupManage/selectWorkGroupDetails.do' />"
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

                        params["sWkgrpNo"] = $("#wkgrpNo").val();

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
                        ,lineNo:{type:"string", validation:{required:true}}
                        ,sysNo:{type:"string"}
                        ,bayNo:{type:"string", editable:false}
                        ,wkgrpNo:{type:"string", editable:false}
                        ,tecId:{type:"string", validation:{required:true}}
                        ,tecNm:{type:"string"}
                    }
                }
            }
        }
        ,height:300
        ,selectable:"row:single"
        ,pageable:false
        ,autoBind:true
        ,editable:true
        ,sortable:false
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
            {field:"rnum", title:"<spring:message code='ser.lbl.no' />", width:50, attributes:{"class":"ac"},hidden:true}
            ,{field:"tecId", title:"<spring:message code='ser.lbl.systemId' />", width:100
                ,attributes:{"class":"al"}
                ,editor:function(container, options) {
                    $('<div class="form_search"><input required type="text" name="tecId" data-name="<spring:message code='ser.lbl.staffNo'/>" class="form_input" readonly="true" /><a href="#" onclick="userAdd(\'D\')" >&nbsp;</a></div>')
                    .appendTo(container);
                    $('<span class="k-invalid-msg" data-for="tecId"></span>')
                    .appendTo(container);
                 }
             }                     // 직원번호
            ,{field:"sysNo", title:"<spring:message code='ser.lbl.staffNo' />", width:100, attributes:{"class":"al"}} // 시스템번호
            ,{field:"tecNm", title:"<spring:message code='ser.lbl.empNm' />", width:150}                       // 직원이름
            ,{field:"", title:"<spring:message code='ser.lbl.userSex' />", width:50}                          // 직원성별
            ,{field:"deptCd", title:"<spring:message code='ser.lbl.deptCd' />", width:150}                     // 부서코드
            ,{field:"deptNm", title:"<spring:message code='ser.lbl.deptNm' />", width:150}                     // 부서코드
            ,{field:"tskCd", title:"<spring:message code='ser.lbl.tskCd' />", width:150}                       // 직무코드
            ,{field:"tskNm", title:"<spring:message code='ser.lbl.tskNm' />", width:150}                       // 직무명칭
            ,{field:"wkgrpNo", hidden:true}                                                                    //반조번호
        ]
    });

 // tablet 사이즈 맞추는거 khskhs 문제시 삭제
    if(${isTablet}){
        if(window.matchMedia('(max-width:1024px)').matches){
            $(".table_grid").attr("style","width:958px !important; max-width:958px !important");
        }
    }
 // tablet 사이즈 맞추는거 khskhs 문제시 삭제
});

</script>

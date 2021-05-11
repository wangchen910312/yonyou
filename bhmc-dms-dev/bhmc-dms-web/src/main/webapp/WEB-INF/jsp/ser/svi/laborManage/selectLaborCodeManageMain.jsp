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
    <!-- 검색조건 -->
        <section class="group">
            <div class="header_area">
                <div class="btn_left">
                    <dms:access viewId="VIEW-D-12956" hasPermission="${dms:getPermissionMask('READ')}">
                        <button type="button" id="btnInit" class="btn_m btn_reset"><spring:message code="global.btn.init" /></button>
                    </dms:access>
                </div>
                <div class="btn_right">
                    <dms:access viewId="VIEW-D-12064" hasPermission="${dms:getPermissionMask('READ')}">
                        <button type="button" class="btn_m " id="btnExcelExport"><spring:message code="ser.btn.excelDownload" /></button>
                    </dms:access>
                    <dms:access viewId="VIEW-D-12063" hasPermission="${dms:getPermissionMask('READ')}">
                        <button type="button" class="btn_m " id="btnExcelImport"><spring:message code="ser.btn.excelUpload" /></button>
                    </dms:access>
                    <dms:access viewId="VIEW-D-12056" hasPermission="${dms:getPermissionMask('READ')}">
                        <button type="button" class="btn_m btn_search" id="btnSearch"><spring:message code="global.btn.search" /></button>
                    </dms:access>
                    <dms:access viewId="VIEW-D-12061" hasPermission="${dms:getPermissionMask('READ')}">
                        <button type="button" class="btn_m btn_s_min5" id="btnSave" ><spring:message code="ser.btn.confirm" /></button>
                    </dms:access>
                    <dms:access viewId="VIEW-D-12062" hasPermission="${dms:getPermissionMask('READ')}">
                        <button type="button" class="btn_m btn_add" id="btnLbrSavePopup"><spring:message code="global.btn.add" /></button>
                    </dms:access>
                    <dms:access viewId="VIEW-D-12060" hasPermission="${dms:getPermissionMask('READ')}">
                        <button type="button" class="btn_m btn_del" id="btnDel" disabled><spring:message code="global.btn.del" /></button>
                    </dms:access>
                </div>
            </div>
            <!--  조회조건시작 -->
            <div class="table_form form_width_70per" role="search" data-btnid="btnSearch" >
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
                            <th scope="row"><spring:message code="ser.lbl.lbrCd" /></th><!-- 공임코드 -->
                            <td>
                                <input id="sLbrCd" type="text" class="form_input" />
                            </td>
                            <th scope="row"><spring:message code='ser.lbl.rpirNm' /></th><!-- 정비명칭 -->
                            <td>
                                <input id="sLbrNm" type="text" class="form_input" />
                            </td>
                            <th scope="row"><spring:message code='ser.lbl.lbrTp' /></th><!-- 수리유형 -->
                            <td>
                                <input type="text" id="sLbrTp" name="sLbrTp" class="form_comboBox"   />
                            </td>
                            <th scope="row"><spring:message code='ser.lbl.lbrDstinCd' /></th><!-- 공임구분 -->
                            <td>
                                <input id="sDstinCd" name="sDstinCd" class="form_comboBox" />
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <!--  조회조건 종료 -->

            <!--  공임마스터 그리드 -->
            <div class="table_grid mt10">
                 <div id="gridMaster" class="grid"></div>
            </div>
        </section>
        <!-- //검색조건 -->
        <form id="laborManageForm">
            <!-- 공임정보 -->
            <section class="group">
                <div class="header_area">
                    <div class="btn_right">
                        <!-- <button type="button" class="btn_m btn_search" id="btnLaborSearchPopup">공임팝업</button> -->
                        <%-- <button type="button" class="btn_s btn_s_min5" id="btnSave" disabled><spring:message code="global.btn.save" /></button> --%>
                    </div>
                </div>
                <div class="table_form" style="display:none">
                    <table>
                        <caption></caption>
                        <colgroup>
                            <col style="width:10%;">
                            <col style="width:16%;">
                            <col style="width:10%;">
                            <col style="width:27%;">
                            <col style="width:10%;">
                            <col>
                        </colgroup>
                        <tbody>
                            <tr>
                                <th scope="row"><span class="bu_required"><spring:message code='ser.lbl.brand' /></span></th>
                                <td class="required_area">
                                    <input id="brandCd" name="brandCd" readonly="readonly" required data-name="<spring:message code='ser.lbl.brand' />" class="form_comboBox readonly_area" data-json-obj="true" /> <!-- 브랜드코드 -->
                                </td>
                                <th scope="row"><span class="bu_required"><spring:message code="ser.lbl.gubun" /></span></th>
                                <td class="required_area">
                                    <input id="dstinCd" name="dstinCd" type="text" readonly="readonly" required data-name="<spring:message code='ser.lbl.gubun' />" class="form_comboBox readonly_area" data-json-obj="true" /> <!-- 구분 -->
                                </td>
                                <th scope="row"><spring:message code='ser.lbl.lbrTp' /></th>
                                <td class="required_area">
                                    <input type="text" id="lbrTp" name="lbrTp" readonly="readonly" class="form_comboBox readonly_area" data-json-obj="true" />
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><span class="bu_required"><spring:message code="ser.lbl.lbrCd" /></span></th>
                                <td class="required_area">
                                    <input id="lbrCd" name="lbrCd" type="text" required data-name="<spring:message code='ser.lbl.lbrCd' />" readonly="readonly" class="form_input form_readonly" data-json-obj="true"/> <!-- 공임코드 -->
                                </td>
                                <th scope="row"><span class="bu_required"><spring:message code="ser.lbl.lbrChnNm" /></span></th>
                                <td class="required_area">
                                    <input id="lbrChnNm" name="lbrChnNm" type="text" required data-name="<spring:message code='ser.lbl.lbrChnNm' />" readonly="readonly" class="form_input form_readonly" data-json-obj="true"/> <!-- 공임중문명 -->
                                </td>
                                <th scope="row"><span class="bu_required"><spring:message code="ser.lbl.lbrEnNm" /></span></th>
                                <td class="required_area">
                                    <input id="lbrEnNm" name="lbrEnNm" type="text" required data-name="<spring:message code='ser.lbl.lbrEnNm' />"  readonly="readonly" class="form_input form_readonly" data-json-obj="true"/> <!-- 공임영문명 -->
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <input type="hidden" id="dlrCd" name="dlrCd" value="${dlrCd}"/>
            </section>
        </form>
        <!-- //공임정보 -->

        <!-- 공임리스트 -->
        <section class="group">
            <div class="header_area">
                <div class="btn_right btn_enableYn" style="display:inline;" >
                    <dms:access viewId="VIEW-D-13098" hasPermission="${dms:getPermissionMask('READ')}">
                        <button type="button" id="btnDetailSave" class="btn_s btn_confirm btn_s_min5" disabled><spring:message code="global.btn.confirm" /></button>
                    </dms:access>
                    <dms:access viewId="VIEW-D-12059" hasPermission="${dms:getPermissionMask('READ')}">
                        <button type="button" class="btn_s btn_add btn_s_min5" id="btnAdd" disabled><spring:message code="global.btn.add" /></button>
                    </dms:access>
                    <dms:access viewId="VIEW-D-12058" hasPermission="${dms:getPermissionMask('READ')}">
                        <button type="button" class="btn_s btn_delete btn_s_min5" id="btnDelete" disabled><spring:message code="global.btn.del" /></button>
                    </dms:access>
                </div>
            </div>
            <!-- 공임 디테일 그리드 -->
            <div class="table_grid">
                <div id="gridDetail" ></div>
            </div>
        </section>
        <!-- //공임리스트 -->
    </div>
</div>

<!-- confirm 팝업 -->
<c:import url="/WEB-INF/jsp/ser/cmm/popup/selectConfirmPopup.jsp" />
<!-- confirm 팝업 -->

<script type="text/javascript">

/****************************** 공통 코드 세팅 ******************************/
var delYnCodeList = []; //삭제여부
<c:forEach var="obj" items="${delYnDs}">
delYnCodeList.push({
     cmmCdNm:"${obj.cmmCdNm}"
    ,cmmCd:"${obj.cmmCd}"
});
</c:forEach>
var delYnMap = dms.data.arrayToMap(delYnCodeList, function(obj){return obj.cmmCd;});


//구분
var dstinCdList = [];
<c:forEach var="obj" items="${dstinDs}">
dstinCdList.push({
    cmmCdNm:"${obj.cmmCdNm}"
   ,cmmCd:"${obj.cmmCd}"
});
</c:forEach>
var dstinMap = dms.data.arrayToMap(dstinCdList, function(obj){return obj.cmmCd;});

//LTS MODEL 코드
var ltsModelCdList =[];
<c:forEach var="obj" items="${ltsModelDs}">
 ltsModelCdList.push({
     cmmCdNm:"${obj.ltsModelNm}"
     , cmmCd:"${obj.ltsModelCd}"});
</c:forEach>
var ltsMap = dms.data.arrayToMap(ltsModelCdList, function(obj){return obj.cmmCd;});

//수리유형
var lbrTpCdList =[];
<c:forEach var="obj" items="${lbrTpCdDs}">
<c:if test='${obj.useYn eq "Y"}' >
  lbrTpCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:if>
</c:forEach>
var lbrTpCdMap = dms.data.arrayToMap(lbrTpCdList, function(obj){return obj.cmmCd;});


//수리코드유형
var lbrCdTpList =[];
<c:forEach var="obj" items="${lbrCdTpDs}">
<c:if test='${obj.useYn eq "Y"}' >
  lbrCdTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:if>
</c:forEach>
var lbrCdTpMap = dms.data.arrayToMap(lbrCdTpList, function(obj){return obj.cmmCd;});


/** 브랜드 코드 **/
var brandCdList = [];
 <c:forEach var="obj" items="${brandCdDs}">
 brandCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
 </c:forEach>

 var brandCdMap = dms.data.arrayToMap(brandCdList, function(obj){return obj.cmmCd});


//그리드 선택 Row
var gridSelectedRow = 0;
var selectedYn = false;


/************ 공임등록 팝업 ************/
var laborSearchPopup;
var laborRegCodePopup;
var excelUploadPopupWin;

$(document).ready( function(){



    laborCodeRegPopupWindow = function(){

        laborRegCodePopup = dms.window.popup({
                windowId:"laborCodePopupWindow"
                ,title:"<spring:message code = 'ser.menu.ltsModelMng'/>"   //
                ,height:300
                ,width:600
                ,content:{
                    url:"<c:url value='/ser/svi/laborManage/selectLaborCodeRegPopup.do'/>"
                    , data:{
                         "autoBind":false
                         ,"callbackFunc":function(data){
                            $("#sDstinCd").data("kendoExtDropDownList").value(data.dstinCd);

                            chageSearch();
                            $("#gridMaster").data("kendoExtGrid").dataSource.page(1);
                        }
                    }
                }
            });
    }


    $("#sLbrCd").bind("keyup",function(){
        $(this).val($(this).val().toUpperCase());
     });


    //LTS MODEL NM
    setLtsModel = function(value){
        var resultVal = "";
        if( dms.string.strNvl(value) != ""){
            if(ltsMap[value] != undefined)
            resultVal = ltsMap[value].cmmCdNm
        }

        return resultVal;
    };

    //수리유형
    setLbrTpCdMap = function(value){
        var resultVal = "";
        if( dms.string.strNvl(value) != ""){
            if(lbrTpCdMap[value] != undefined)
            resultVal = lbrTpCdMap[value].cmmCdNm
        }

        return resultVal;
    };

    //수리코드유형
    setLbrCdTpMap = function(value){
        var resultVal = "";
        if( dms.string.strNvl(value) != ""){
            if(lbrCdTpMap[value] != undefined)
            resultVal = lbrCdTpMap[value].cmmCdNm
        }

        return resultVal;
    };

    //구분
    setDstinMap = function(value){
        var resultVal = "";
        if( dms.string.strNvl(value) != ""){
            if(dstinMap[value] != undefined)
            resultVal = dstinMap[value].cmmCdNm
        }

        return resultVal;
    };

    var validator = $("#laborManageForm").kendoExtValidator().data("kendoExtValidator");

    /** 초기화버튼 **/
    $("#btnInit").kendoButton({
        click:function(e){
            $("#gridMaster").data("kendoExtGrid").dataSource.page(1);
            $("#gridDetail").data("kendoExtGrid").dataSource.data([]);
            initAll();
        }
    });

    /** 조회버튼 **/
    $("#btnSearch").kendoButton({
        click:function(e){
            $("#gridMaster").data("kendoExtGrid").dataSource.page(1);
            $("#gridDetail").data("kendoExtGrid").dataSource.data([]);
           // initAll();
        }
    });


    chageSearch = function(){

        $("#btnSearch").click();

        //btn_enableYn
        var dstinCd = $("#sDstinCd").data("kendoExtDropDownList").value();

        if(dstinCd != "H" && dstinCd != "E"){
            $(".btn_enableYn").attr("style","display:inline;");
        }else{
            //$(".btn_enableYn").attr("style","display:none;");
            $(".btn_enableYn").attr("style","display:inline;");
        }
        $("#btnDel").data("kendoButton").enable((dstinCd == "D" ) ? true : false);

        setButtonEnable("N");

    };


    /** 조회 구분 **/
    $("#sDstinCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
       ,dataValueField:"cmmCd"
       ,dataSource   :dstinCdList
       ,index        :0
       ,change:chageSearch
    });

    /** 조회조건 수리유형 **/
    $("#sLbrTp").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
       ,dataValueField:"cmmCd"
       ,dataSource:lbrTpCdList
       ,optionLabel : " "
       ,index:0
       ,change:chageSearch

    });

    /** 구분 **/
    $("#dstinCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
       ,dataValueField:"cmmCd"
       ,dataSource   :dstinCdList
       ,change:function (e){
           $("#gridDetail").data("kendoExtGrid").dataSource._destroyed = [];
           $("#gridDetail").data("kendoExtGrid").dataSource.read();
       }
       ,index:0
    });
    /** 브랜드 **/
    $("#brandCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
       ,dataValueField:"cmmCd"
       ,dataSource:brandCdList
       ,index:0

    });

    /** 수리유형 **/
    $("#lbrTp").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
       ,dataValueField:"cmmCd"
       ,dataSource: lbrTpCdList
       ,index:0

    });

    /** 엑셀 다운 버튼**/
    $("#btnExcelExport").kendoButton({

        click:function(e){
            dms.ajax.excelExport({
                 "beanName"        : "laborCodeManageService"
                ,"templateFile"    : "LaborDetailRegList_Tpl.xlsx"
                ,"fileName"        : "<spring:message code='ser.menu.ltsModelMng' />.xlsx"
                ,"sLbrCd"          : $("#sLbrCd").val()
                ,"sLbrNm"          : $("#sLbrNm").val()
                ,"sDstinCd"        : $("#sDstinCd").data("kendoExtDropDownList").value()
                ,"sLbrTp"          : $("#sLbrTp").data("kendoExtDropDownList").value()
                ,"sDlrCd"          : $("#dlrCd").val()
            });
        }
    });

    //버튼 - 엑셀 Import
    $("#btnExcelImport").kendoButton({
        click:function(e) {
            excelUploadPopupWin = dms.window.popup({
                title:"<spring:message code='ser.lbl.lbrInfoUpload' />"
                ,width:800
                ,height:350
                ,windowId:"excelUploadPopupWin"
                ,content:{
                    url:"<c:url value='/ser/cmm/popup/selectLaborUploadPopup.do'/>"
                    ,data:{
                        "callbackFunc":function(){
                           excelUploadPopupWin.close();
                        }
                    }
                }
            });
        }
    });

    /** 디테일그리드 저장 버튼 **/
    $("#btnDetailSave").kendoButton({
        click:function (e){
            /** 저장 체크로직**/
             if(!saveCheckValue()){
                 return false;
            }

            if (validator.validate()) { //validation check
                var gridMaster     = $("#gridMaster").data("kendoExtGrid");
                var gridDetail     = $("#gridDetail").data("kendoExtGrid");

                var formSaveData = $("#laborManageForm").serializeObject( $("#laborManageForm").serializeArrayInSelector("[data-json-obj='true']"));
                var saveData = gridDetail.getCUDData("insertList", "updateList", "deleteList");

                //form data
                var param = $.extend(
                         {"laborCodeMasterVO": formSaveData }
                        ,{"laborCodeDetailVO": saveData}
                        );

                if(gridDetail.gridValidation()){
                    $.ajax({
                        url :"<c:url value='/ser/svi/laborManage/multiLaborDetail.do' />"
                       ,data:JSON.stringify(param)
                       ,type:'POST'
                       ,dataType:'json'
                       ,contentType:'application/json'
                       ,error:function(jqXHR,status,error) {
                           dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                       }
                       ,success:function (jqXHR, textStatus){

                           selectedYn = true;
                           gridSelectedRow = gridMaster.select().index();

                           gridDetail.dataSource._destroyed = [];
                           gridMaster.dataSource.page(1);
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
        }

    });


    /** 디테일그리드 라인 추가버튼 **/
    $("#btnAdd").kendoButton({

        click:function (e){
            var grid = $("#gridDetail").data("kendoExtGrid").dataSource;
            grid.insert(0,{
                 "dlrCd": $("#dlrCd").val()
                ,"ltsModelCd":"ALL"
                ,"ltsModelNm":setLtsModel("ALL")
                ,"lbrHm":1
                ,"allocLbrHm":1
                ,"lbrCnt":1
                ,"payLbrHm":1
                ,"diffVal":1
                ,"serCnt":1
                ,"delYn":"N"
                ,"lbrCd":$("#lbrCd").val()
                ,"dstinCd":$("#dstinCd").val()
                ,"brandCd":$("#brandCd").val()
                ,"validStartDt":""
                ,"validEndDt":""
            });
        }

    });

    /** 디테일그리드 라인 삭제버튼 **/
    $("#btnDelete").kendoButton({
        click:function (e){
            var grid = $("#gridDetail").data("kendoExtGrid");
            var rows = grid.select();
            rows.each(function(index, row) {
                grid.removeRow(row);
            });
        }

    });

    /** 디테일그리드 라인 저장버튼 **/
    $("#btnSave").kendoButton({
         click:function (e){

          if (validator.validate()) { //validation check

                var gridMaster = $("#gridMaster").data("kendoExtGrid");
                var saveData = gridMaster.getCUDData("insertList", "updateList", "deleteList");
                var formData = $("#laborManageForm").serializeObject( $("#laborManageForm").serializeArrayInSelector("[data-json-obj='true']"));

                var param = $.extend(
                         {"laborCodeMasterVO": formData }
                        ,{"laborCodeMasterListVO": saveData }
                        );

                if(gridMaster.gridValidation()){
                    $.ajax({
                        url :"<c:url value='/ser/svi/laborManage/multiLaborMaster.do' />"
                       ,data:JSON.stringify(param)
                       ,type:'POST'
                       ,dataType:'json'
                       ,contentType:'application/json'
                       ,error:function(jqXHR,status,error) {
                           dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                       }
                       ,success:function (jqXHR, textStatus){

                           selectedYn = true;
                           gridSelectedRow = gridMaster.select().index();

                           gridMaster.dataSource.page(1);
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
         }
    });

    /** 삭제버튼 **/
    $("#btnDel").kendoButton({
         click:function (e){

             var grid = $("#gridMaster").data("kendoExtGrid");

             var selectedVal = grid.dataItem(grid.select());
             if(selectedVal==null||selectedVal==""){
                  dms.notification.info("<spring:message code='global.info.selectEmptyRowMsg'/>");
                  return;
             }

             $("#messageId").html("<spring:message code='ser.lbl.del' var='global_lbl_del' />"+
                                  "<spring:message code='global.info.cnfrmMsg' arguments='${global_lbl_del}' />");
             conformKendoWindow.content( $(".msgDiv").html());
             conformKendoWindow.open();

             $(".yes, .no").click(function(){

                 if($(this).hasClass("yes")){

                     conformKendoWindow.close();
                     var formSaveData = $("#laborManageForm").serializeObject( $("#laborManageForm").serializeArrayInSelector("[data-json-obj='true']"));

                     $.ajax({
                         url :"<c:url value='/ser/svi/laborManage/deleteLabor.do' />"
                        ,data:JSON.stringify(formSaveData)
                        ,type:'POST'
                        ,dataType:'json'
                        ,contentType:'application/json'
                        ,error:function(jqXHR,status,error) {
                            dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                        }
                        ,success:function (jqXHR, textStatus){

                            $("#gridMaster").data("kendoExtGrid").dataSource.page(1);
                            $("#gridDetail").data("kendoExtGrid").dataSource.data([]);
                            selectedYn = false;
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
                      conformKendoWindow.close();
                  }
              }).end();
         }
    });

    // 공임 등록 팝업
    $("#btnLbrSavePopup").kendoButton({
        click:function(e){
            laborCodeRegPopupWindow();
        }
    });


    /** 초기화 **/
    initAll = function(e){
        $("#sLbrCd").val("");
        $("#sLbrNm").val("");
        $("#sLbrTp").data("kendoExtDropDownList").value("");
        $("#sDstinCd").data("kendoExtDropDownList").value("H");
        $("#laborManageForm").get(0).reset();
    };

    /**버튼 상태변경**/
    setButtonEnable = function (sFlag){

        var dstinYn = ($("#dstinCd").val() != "H" && $("#dstinCd").val() != "E") ? true : false;
        var bFlag = ( dstinYn ) ? true : false;
        var fieldFlag = ( dstinYn ) ? false:true;

        switch(sFlag){
            case "Y" :
                $("#btnAdd").data("kendoButton").enable(bFlag);
                $("#btnSave").data("kendoButton").enable(true);
                $("#btnDelete").data("kendoButton").enable(bFlag);
                $("#btnDetailSave").data("kendoButton").enable(true);
                $("#btnDel").data("kendoButton").enable(($("#dstinCd").val() == "D" ) ? true : false);
                      break;
            case "N" :
                $("#btnAdd").data("kendoButton").enable(false);
                $("#btnSave").data("kendoButton").enable(false);
                $("#btnDelete").data("kendoButton").enable(false);
                $("#btnDetailSave").data("kendoButton").enable(false);
                $("#btnDel").data("kendoButton").enable(false);
                      break;
            default :
                $("#btnAdd").data("kendoButton").enable(false);
                $("#btnSave").data("kendoButton").enable(false);
                $("#btnDelete").data("kendoButton").enable(false);
                $("#btnDetailSave").data("kendoButton").enable(false);
                $("#btnDel").data("kendoButton").enable(false);
                     break;
        }

    };


    /** 저장 필수값 체크 **/
    saveCheckValue = function (e){


        var msgText;
        var result = true;

        var grid = $("#gridDetail").data("kendoExtGrid");
        var resultCnt = 0;
        var dstinCd = $("#sDstinCd").data("kendoExtDropDownList").value();

        // 그리드 필수값 체크
        $.each(grid.dataSource._data, function(idx, data){


            if(data.ltsModelCd == ""){
                msgText = "<spring:message code='ser.lbl.ltsModelCd' var='global_lbl_ltsModelCd' />"+
                "<spring:message code='global.info.required.field' arguments='${global_lbl_ltsModelCd}' />";

                result = false;
                return false;
            }

            $.each(ltsModelCdList , function(idx , ltsData){

                if(ltsModelCdList[idx].cmmCd == data.ltsModelCd){
                    resultCnt++;
                }
            });

            if(ltsModelCdList.length > 0 &&  resultCnt < 1 ){
                msgText = "<spring:message code='ser.lbl.ltsModelCd' var='global_lbl_ltsModelCd' />"+
                "<spring:message code='global.info.confirmMsgParam' arguments='${global_lbl_ltsModelCd}' />";

                result = false;
                return false;
            }
            //20190722 田佳兴修改维修工时为0也可修改派工工时
            if(data.lbrHm < 0){
                msgText = "<spring:message code='ser.lbl.lbrTime' var='ser_lbl_lbrTime' />"+
                "<spring:message code='global.info.required.field' arguments='${ser_lbl_lbrTime}' />";

                result = false;
                return false;
            }

            if(data.validStartDt == ""){
                msgText = "<spring:message code='ser.lbl.validStartDt' var='global_lbl_validStartDt' />"+
                "<spring:message code='global.info.required.field' arguments='${global_lbl_validStartDt}' />";

                result = false;
                return false;
            }
            if(data.validEndDt == ""){
                msgText = "<spring:message code='ser.lbl.validEndDt' var='global_lbl_validEndDt' />"+
                "<spring:message code='global.info.required.field' arguments='${global_lbl_validEndDt}' />";

                result = false;
                return false;
            }
        });

        if( $("#lbrCd").val() == "" ) {
            msgText = "<spring:message code='ser.lbl.lbrCd' var='global_lbl_lbrCd' />"+
                      "<spring:message code='global.info.required.field' arguments='${global_lbl_lbrCd}' />";

                      $("#lbrCd").focus();
                      result =  false;

        }else if( $("#lbrChnNm").val() == "" ){
            msgText = "<spring:message code='ser.lbl.lbrChnNm' var='global_lbl_lbrChnNm' />"+
                      "<spring:message code='global.info.required.field' arguments='${global_lbl_lbrChnNm}' />";

                      $("#lbrChnNm").focus();
                      result =  false;

        }else if( $("#lbrEnNm").val() == "" ){
            msgText = "<spring:message code='ser.lbl.lbrEnNm' var='global_lbl_lbrEnNm' />"+
                      "<spring:message code='global.info.required.field' arguments='${global_lbl_lbrEnNm}' />";

                      $("#lbrEnNm").focus();
                      result =  false;

        }else if( (dstinCd == 'D' || dstinCd == 'Z') && isRegCheck() == false ){
            msgText = "<spring:message code='ser.lbl.lbrEnNm' var='global_lbl_lbrEnNm' />"+
                      "<spring:message code='global.info.required.engnum' arguments='${global_lbl_lbrEnNm}' />";

                      $("#lbrEnNm").focus();
                      result =  false;
        }

        if(!result) dms.notification.warning(msgText);
        return result;
    };

    isRegCheck = function(param){
        var regExp = /^[a-zA-Z0-9 -/]+$/g;
        var val = $("#lbrEnNm").val();
        var rtn = regExp.test(val);

        return rtn;
    };

    // Master Grid
    $("#gridMaster").kendoExtGrid({
        gridId:"G-SER-1011-000122"
        ,dataSource:{
            transport:{
                   read :{
                       url:"<c:url value='/ser/svi/laborManage/selectLaborCodeManages.do' />"
                   }
                 ,parameterMap:function(options , operation){
                     if(operation == "read"){

                         // 검색 조건을 파라미터로 담는다.
                         var params = {};
                         params["recordCountPerPage"] = options.pageSize;
                         params["pageIndex"] = options.page;
                         params["firstIndex"] = options.skip;
                         params["lastIndex"] = options.skip + options.take;
                         params["sort"] = options.sort;

                         params["sLbrCd"] = $("#sLbrCd").val();
                         params["sLbrNm"] = $("#sLbrNm").val();
                         params["sDstinCd"] = $("#sDstinCd").val();
                         params["sDlrCd"] = $("#dlrCd").val();
                         params["sLbrTp"] = $("#sLbrTp").val();

                         return kendo.stringify(params);
                     }else if(operation != "read" && options.models){
                         return kendo.stringify(options.models);
                     }
                 }//parameterMap
            }//transport
           ,schema:{
                 model:{
                     id:"rnum"
                    ,fields:{
                        rnum:{type:"number", editable:false }
                       ,lbrCd:{type:"string", editable:false }
                       ,dstinCd:{type:"string", editable:false }
                       ,lbrTp:{type:"string" }
                       ,brandCd:{type:"string", editable:false }
                       ,lbrEnNm:{type:"string" }
                       ,lbrChnNm:{type:"string" }
                       ,remark:{type:"string" }
                       ,lbrCdTp:{type:"string" }
                    }

                 }//model
           }//schema
        }//dataSource
        ,scrollable:true
        ,autoBind:true
        ,selectable:"row"
        ,height:200
        ,filterable:false                 // 필터링 기능 사용안함
        ,dataBound:function(e) {
            if(selectedYn ){
                e.sender.select(e.sender.tbody.find("tr")[gridSelectedRow]);
            }
        }
        ,edit:function(e){
            var selectedVal = this.dataItem(this.select());
            var sDstinCd = selectedVal.dstinCd;
            if(sDstinCd == "H" || sDstinCd == "E") {
                this.closeCell();
            }
        }
        ,change:function (e){
            var selectedVal = this.dataItem(this.select());
            var sDstinCd = selectedVal.dstinCd;
            var sBrandCd = selectedVal.brandCd;
            var sLbrCd   = selectedVal.lbrCd;
            var sLbrTp   = selectedVal.lbrTp;
            var sDlrCd   = selectedVal.dlrCd;

            $("#dstinCd").data("kendoExtDropDownList").value(sDstinCd);
            $("#brandCd").data("kendoExtDropDownList").value(sBrandCd);
            $("#lbrTp").data("kendoExtDropDownList").value(sLbrTp);

            $("#dlrCd").val(sDlrCd);

            $("#lbrCd").val(sLbrCd);
            $("#lbrChnNm").val(selectedVal.lbrChnNm);
            $("#lbrEnNm").val(selectedVal.lbrEnNm);

            $("#gridDetail").data("kendoExtGrid").dataSource._destroyed = [];
            $("#gridDetail").data("kendoExtGrid").dataSource.page(1);
            setButtonEnable("Y");

        }
        ,columns:[
            {field:"rnum", title:"<spring:message code='ser.lbl.no' />", width:50, sortable:false, attributes:{"class":"ac"} ,hidden:true}
           ,{field:"dstinCd", title:"<spring:message code='ser.lbl.lbrDstinCd' />", width:70, sortable:false
               ,attributes:{"class":"ac"}
               ,template:"#= setDstinMap(dstinCd) #"

           }//공임구분 工时
           ,{field:"lbrTp", title:"<spring:message code='ser.lbl.lbrTp' />", width:80, sortable:false
               ,attributes:{"class":"ac"}
               ,template:"#= setLbrTpCdMap(lbrTp) #"
               ,editor:function(container, options){
                   $('<input required name="lbrTp" data-bind="value:' + options.field + '"/>')
                   .appendTo(container)
                   .kendoExtDropDownList({
                       dataTextField:"cmmCdNm"
                       ,dataValueField:"cmmCd"
                       ,dataSource:lbrTpCdList
                       ,change:function(){
                           var selectVal = this.value();
                       }
                   });
               }
           }
           ,{field:"lbrCd", title:"<spring:message code='ser.lbl.lbrCd' />", width:80, sortable:true, attributes:{"class":"al"}}
           ,{field:"lbrEnNm", title:"<spring:message code='ser.lbl.lbrEnNm' />", width:250, sortable:false, attributes:{"class":"al"}}
           ,{field:"lbrChnNm", title:"<spring:message code='ser.lbl.rpirNm' />", width:250, sortable:false, attributes:{"class":"al"}}
           ,{field:"remark", title:"<spring:message code='ser.lbl.lbrRemark' />", width:180, sortable:false, attributes:{"class":"al"}}
           ,{field:"lbrCdTp", title:"<spring:message code='ser.lbl.lbrCdTp' />", width:80, attributes:{"class":"ac"} //공임코드유형
               ,sortable:false
               ,template:"#= setLbrCdTpMap(lbrCdTp) #"
               ,editor:function(container, options){
                   $('<input required name="lbrCdTp" data-bind="value:' + options.field + '"/>')
                   .appendTo(container)
                   .kendoExtDropDownList({
                       dataTextField:"cmmCdNm"
                       ,dataValueField:"cmmCd"
                       ,dataSource:lbrCdTpList
                       ,valuePrimitive:true
                       ,change:function(){
                           var selectVal = this.value();
                       }
                   });
               }
           }
           ,{field:"brandCd", title:"<spring:message code='ser.lbl.brand' />", width:100, sortable:false, attributes:{"class":"al"}, hidden:true}
         ]

    });


    //Detail Grid
    $("#gridDetail").kendoExtGrid({
        gridId:"G-SER-1011-000123"
        ,dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/ser/svi/laborManage/selectLaborCodeManageDetail.do' />"
                }
                ,parameterMap:function(options , operation){
                    if(operation == "read"){

                     // 검색 조건을 파라미터로 담는다.
                        var params = {};
                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        params["sLbrCd"]   = $("#lbrCd").val();
                        params["sDlrCd"]   = $("#dlrCd").val();
                        params["sDstinCd"] = $("#dstinCd").val();
                        params["sBrandCd"] = $("#brandCd").val();

                        return kendo.stringify(params);

                    }else if( operation != "read" && options.models){
                        return kendo.stringify(options.models);
                    }
                }//parameterMap
            }//transport
            ,schema:{
                model:{
                     id:"rnum"
                    ,fields:{
                        rnum:{type:"number" , editable:false}
                       ,ltsModelCd:{type:"string"  }
                       ,ltsModelNm:{type:"string" , editable:false}
                       ,lbrHm:{type:"number" ,  validation:{required:true}}
                       ,validStartDt:{type:"date" , validation:{required:true}}
                       ,validEndDt:{type:"date" , validation:{required:true}}
                       ,delYn:{type:"string" , validation:{required:true}}
                       ,lbrCd:{type:"string" }
                       ,dstinCd:{type:"string" }
                       ,brandCd:{type:"string" }
                       ,dlrCd:{type:"string" }
                    }

                }//model
            }//schema
        }//dataSource
        ,visibleFilterRow:false             //필터로우 출력여부, default:false
        ,height:400
        ,selectable:"row"
        ,pageable:false
        ,scrollable:true
        ,sortable:false
        ,autoBind:false
        ,edit:function(e){
            var fieldName = $(e.container.find("input")[1]).attr("name");
            var fieldName2 = $(e.container.find("input")[0]).attr("name");


            if ($("#dstinCd").val() == "H") {

                 if(fieldName2 =="ltsModelCd" ||
                         fieldName2 =="ltsModelNm" ||
                         fieldName=="lbrHm" ||
                         fieldName=="validStartDt" ||
                         fieldName=="validEndDt"){
                     this.closeCell();
                 }
             }
         }
        ,change:function(e){
            var selectedVal = this.dataItem(this.select());
        }
        ,columns:[
            {field:"ltsModelCd", title:"<spring:message code='ser.lbl.ltsModelCode' />", width:150, sortable:true
              ,attributes:{"class":"al"}
              ,template:"[#:ltsModelCd#] #= setLtsModel(ltsModelCd) #"
              ,editor:function(container, options) {
                    $('<input required name="ltsModelCd" data-name="<spring:message code="ser.lbl.ltsModelCd" />" data-bind="value:' + options.field + '"/>')
                    .appendTo(container)
                    .kendoExtDropDownList({
                        valuePrimitive:true
                       ,dataValueField:"cmmCd"
                       ,dataTextField: "cmmCd"
                       ,template:"[#:cmmCd#] #= cmmCdNm #"
                       ,dataSource:ltsModelCdList
                       ,change:setLtsModelNm
                   });
                    $('<span class="k-invalid-msg" data-for="ltsModelCd"></span>').appendTo(container);
                }
            }
            ,{field:"ltsModelNm", title:"<spring:message code='ser.lbl.ltsModelNm' />", width:300, sortable:false, attributes:{"class":"al"}
                ,editor:function(container, options) {
                    $('<input type="text" name="ltsModelNm" maxLength="13" class="form_input"  />')
                    .appendTo(container);
                    $('<span class="k-invalid-msg" data-for="ltsModelNm"></span>')
                    .appendTo(container);
                 }
            } //LTS MODEL 명
            ,{field:"lbrHm", title:"<spring:message code='ser.lbl.chargeLbr' />", width:120, sortable:false
                , attributes:{"class":"ar"}
                , editor:function(container, options){
                    $('<input required name="lbrHm" min=0 maxLength=5 data-name="<spring:message code="ser.lbl.lbrTime" />" data-bind="value:' + options.field + '"/>')
                    .appendTo(container)
                    .kendoExtNumericTextBox({
                        format:"n2"                // n0:###,###, n2:###,###.##
                       ,decimals:2                // 소숫점
                       ,min:0.00
                       ,value:0.00
                       ,spinners:false
                    });
                    $('<span class="k-invalid-msg" data-for="lbrHm"></span>').appendTo(container);
                 }
            }//공임시간
            ,{field:"payLbrHm", title:"<spring:message code='ser.lbl.rpirDt' />", width:120, sortable:false
                , attributes:{"class":"ar"}
                , editor:function(container, options){
                    $('<input required name="payLbrHm" min=0 maxLength=5 data-name="<spring:message code="ser.lbl.chargeLbr" />" data-bind="value:' + options.field + '"/>')
                    .appendTo(container)
                    .kendoExtNumericTextBox({
                        format:"n2"                // n0:###,###, n2:###,###.##
                       ,decimals:2                // 소숫점
                       ,min:0.00
                       ,value:0.00
                       ,spinners:false
                    });
                    $('<span class="k-invalid-msg" data-for="payLbrHm"></span>').appendTo(container);
                 }
            }//정비공임
            ,{field:"allocLbrHm", title:"<spring:message code='ser.lbl.dstbHm' />", width:120, sortable:false
                , attributes:{"class":"ar"}
                , editor:function(container, options){
                    $('<input required name="allocLbrHm" min=0 maxLength=5 data-name="<spring:message code="ser.lbl.dstbHm" />" data-bind="value:' + options.field + '"/>')
                    .appendTo(container)
                    .kendoExtNumericTextBox({
                        format:"n2"                // n0:###,###, n2:###,###.##
                       ,decimals:2                // 소숫점
                       ,min:0.00
                       ,value:0.00
                       ,spinners:false
                    });
                    $('<span class="k-invalid-msg" data-for="allocLbrHm"></span>').appendTo(container);
                 }
            }//배분공임
            ,{field:"lbrCnt", title:"<spring:message code='ser.lbl.rpipHmDegree' />", width:120, sortable:false, hidden:true
                , attributes:{"class":"ar"}
                , editor:function(container, options){
                    $('<input required name="lbrCnt" min=0 maxLength=5 data-name="<spring:message code="ser.lbl.lbrTime" />" data-bind="value:' + options.field + '"/>')
                    .appendTo(container)
                    .kendoExtNumericTextBox({
                        format:"n2"                // n0:###,###, n2:###,###.##
                       ,decimals:2                // 소숫점
                       ,min:0.00
                       ,value:0.00
                       ,spinners:false
                    });
                    $('<span class="k-invalid-msg" data-for="lbrCnt"></span>').appendTo(container);
                 }
            }//정비건수
            ,{field:"diffVal", title:"<spring:message code='ser.lbl.difcDegree' />", width:120, sortable:false, hidden:true
                , attributes:{"class":"ar"}
                , editor:function(container, options){
                    $('<input required name="diffVal" min=0 maxLength=5 data-name="<spring:message code="ser.lbl.lbrTime" />" data-bind="value:' + options.field + '"/>')
                    .appendTo(container)
                    .kendoExtNumericTextBox({
                        format:"n2"                // n0:###,###, n2:###,###.##
                       ,decimals:2                // 소숫점
                       ,min:0.00
                       ,value:0.00
                       ,spinners:false
                    });
                    $('<span class="k-invalid-msg" data-for="diffVal"></span>').appendTo(container);
                 }
            }//수리난의도
            ,{field:"serCnt", title:"<spring:message code='ser.lbl.serCnt' />", width:120, sortable:false
                , attributes:{"class":"ar"}
                , editor:function(container, options){
                    $('<input required name="serCnt" min=0 maxLength=5 data-name="<spring:message code="ser.lbl.lbrTime" />" data-bind="value:' + options.field + '"/>')
                    .appendTo(container)
                    .kendoExtNumericTextBox({
                        format:"n2"                // n0:###,###, n2:###,###.##
                       ,decimals:2                // 소숫점
                       ,min:0.00
                       ,value:0.00
                       ,spinners:false
                    });
                    $('<span class="k-invalid-msg" data-for="lbrHm"></span>').appendTo(container);
                 }
            }//수리건수
            ,{field:"validStartDt", title:"<spring:message code='ser.lbl.validStartDt' />", width:120, sortable:false
                ,attributes:{"class":"ac"}
                ,format:"{0:<dms:configValue code='dateFormat' />}"
                ,editor:function (container, options){
                    $('<input id="validStartDt" required name="validStartDt" data-name="<spring:message code="ser.lbl.validStartDt" />" data-bind="value:' + options.field + '"/>')
                    .appendTo(container)
                    .kendoExtMaskedDatePicker({
                        format:"{0:<dms:configValue code='dateFormat' />}"
                       ,dateValidMessage:"<spring:message code='ser.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
                       ,value:""
                    });
                    $('<span class="k-invalid-msg" data-for="validStartDt"></span>').appendTo(container);
                }
            }//유효시작일자
            ,{field:"validEndDt", title:"<spring:message code='ser.lbl.validEndDt' />", width:120, sortable:false
                ,attributes:{"class":"ac"}
                ,format:"{0:<dms:configValue code='dateFormat' />}"
                ,editor:function (container, options){
                    $('<input required id="validEndDt" data-name="<spring:message code="ser.lbl.validEndDt" />" name="validEndDt" data-bind="value:' + options.field + '"/>')
                    .appendTo(container)
                    .kendoExtMaskedDatePicker({
                        format:"{0:<dms:configValue code='dateFormat' />}"
                        ,value:""
                    });
                    $('<span class="k-invalid-msg" data-for="validEndDt"></span>').appendTo(container);

                }
            }//유효종료일자
            ,{field:"delYn", title:"<spring:message code='ser.lbl.delYn' />", width:80, sortable:false
                ,attributes:{"class":"ac"}
                ,template:"#=delYnMap[delYn].cmmCdNm#"
                ,editor:function(container, options) {
                    $('<input required name="delYn" data-name="<spring:message code="ser.lbl.delYn" />" data-bind="value:' + options.field + '"/>')
                    .appendTo(container)
                    .kendoExtDropDownList({
                         dataTextField:"cmmCdNm"
                        ,dataValueField:"cmmCd"
                        ,dataSource:delYnCodeList

                    });
                    $('<span class="k-invalid-msg" data-for="delYn"></span>').appendTo(container);
                }, hidden:true
              }//삭제여부
            ,{field:"lbrCd", title:"<spring:message code='ser.lbl.lbrCd' />", width:100, sortable:false, attributes:{"class":"al"}, hidden:true}//공임코드
            ,{field:"dstinCd", title:"<spring:message code='ser.lbl.gubun' />", width:100, attributes:{"class":"al"}, hidden:true}//구분코드
            ,{field:"dlrCd", title:"<spring:message code='ser.lbl.dlrCd' />", width:100, attributes:{"class":"al"}, hidden:true}//딜러코드
            ,{field:"brandCd", title:"<spring:message code='ser.lbl.brand' />", width:80, attributes:{"class":"al"}, hidden:true}//브랜드코드
        ]

    });

    setLtsModelNm = function(e){

        var grid = $("#gridDetail").data("kendoExtGrid");//.dataSource._data;
        var selectedVal = grid.dataItem(grid.select());
        selectedVal.set("ltsModelNm",setLtsModel(selectedVal.ltsModelCd));

    };

 // tablet 사이즈 맞추는거 khskhs 문제시 삭제
    if(${isTablet}){
        if(window.matchMedia('(max-width:1024px)').matches){
            $(".table_grid").attr("style","width:958px !important; max-width:958px !important");
        }
    }
 // tablet 사이즈 맞추는거 khskhs 문제시 삭제

});
// document.ready 종료

</script>
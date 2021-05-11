<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>


<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.service-1.0.js' />"></script>

<div id="resizableContainer">
    <div class="content">
    <!-- 검색조건 -->
        <section class="group">
            <div class="header_area">
                <div class="btn_left">
<%--                     <dms:access viewId="VIEW-D-" hasPermission="${dms:getPermissionMask('READ')}"> --%>
                        <button type="button" id="btnInit" class="btn_m btn_reset"><spring:message code="global.btn.init" /></button>
<%--                     </dms:access> --%>
                </div>
                <div class="btn_right">
<%--                     <dms:access viewId="VIEW-D-" hasPermission="${dms:getPermissionMask('READ')}"> --%>
                        <button type="button" class="btn_m " id="btnExcelExport"><spring:message code="ser.btn.excelDownload" /></button>
<%--                     </dms:access> --%>
<%--                     <dms:access viewId="VIEW-D-" hasPermission="${dms:getPermissionMask('READ')}"> --%>
<%--                         <button type="button" class="btn_m " id="btnExcelImport"><spring:message code="ser.btn.excelUpload" /></button> --%>
<%--                     </dms:access> --%>
    				<dms:access viewId="VIEW-I-12416" hasPermission="${dms:getPermissionMask('READ')}">
                        <button type="button" class="btn_m btn_search" id="btnSearch" ><spring:message code="global.btn.search" /></button>
    				</dms:access>
<%--                     <dms:access viewId="VIEW-D-" hasPermission="${dms:getPermissionMask('READ')}"> --%>
                        <button type="button" class="btn_m btn_s_min5" id="btnSave" ><spring:message code="ser.btn.confirm" /></button>
<%--                     </dms:access> --%>
                    <dms:access viewId="VIEW-I-12417" hasPermission="${dms:getPermissionMask('READ')}">
                        <button type="button" class="btn_m btn_add" id="btnLbrSavePopup"><spring:message code="global.btn.add" /></button>
                    </dms:access>
<%--                     <dms:access viewId="VIEW-D-" hasPermission="${dms:getPermissionMask('READ')}"> --%>
                        <button type="button" class="btn_m btn_del" id="btnDel" disabled><spring:message code="global.btn.del" /></button>
<%--                     </dms:access> --%>
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
                            <th scope="row"><spring:message code='ser.lbl.lbrTp' /></th> <!-- 수리유형 -->
                            <td>
                                <input type="text" id="sLbrTp" name="sLbrTp" class="form_comboBox"   />
                            </td>
                            <th scope="row"><spring:message code='ser.lbl.lbrDstinCd' /></th> <!-- 구분 -->
                            <td>
                                <input id="sDstinCd" type="text" class="form_comboBox" />
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

        <!-- 공임정보 -->
        <form id="laborManageForm">
            <section class="group">
                <div class="header_area">
                    <%-- <h2 class="title_basic"><spring:message code="ser.title.lbrOperInfo" /></h2>
                    <div class="btn_right">
                        <dms:access viewId="VIEW-I-12971" hasPermission="${dms:getPermissionMask('READ')}">
                            <button type="button" class="btn_s btn_s_min5" id="btnDetailSave" disabled><spring:message code="global.btn.save" /></button>
                        </dms:access>
                    </div> --%>
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
                                    <input id="lbrTp" name="lbrTp" type="text" readonly="readonly" class="form_comboBox readonly_area" data-json-obj="true" />
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
                    <h2 class="title_basic"><spring:message code="ser.title.lbrList" /></h2>
                    <div class="btn_right">
                        <dms:access viewId="VIEW-I-12971" hasPermission="${dms:getPermissionMask('READ')}">
                            <button type="button" class="btn_s btn_confirm btn_s_min5" id="btnDetailSave" disabled><spring:message code="global.btn.confirm" /></button>
                        </dms:access>
                        <dms:access viewId="VIEW-I-12974" hasPermission="${dms:getPermissionMask('READ')}">
                            <button type="button" class="btn_s btn_add btn_s_min5" id="btnAdd" disabled><spring:message code="global.btn.add" /></button>
                        </dms:access>
                        <dms:access viewId="VIEW-I-12973" hasPermission="${dms:getPermissionMask('READ')}">
                            <button type="button" class="btn_s btn_delete btn_s_min5" id="btnDelete" disabled><spring:message code="global.btn.del" /></button>
                        </dms:access>
                        <%-- <dms:access viewId="VIEW-I-12972" hasPermission="${dms:getPermissionMask('READ')}">
                            <button type="button" class="btn_s btn_cancel btn_s_min5" id="btnCancel" disabled><spring:message code="global.btn.cancel" /></button>
                        </dms:access> --%>
                    </div>
                </div>
                <!-- 공임 디테일 그리드 -->
                <div class="table_grid">
                    <div id="gridDetail" class="grid"></div>
                </div>
            </section>
            <!-- //공임리스트 -->
        </div>
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

function laborCodeRegPopupWindow(){

    laborRegCodePopup = dms.window.popup({
            windowId:"laborCodePopupWindow"
            ,title:"<spring:message code = 'ser.menu.ltsModelMng'/>"
            ,height:300
            ,width:600
            ,content:{
                url:"<c:url value='/ser/svi/laborManage/selectLaborCodeRegPopup.do'/>"
                , data:{
                     "autoBind":false
                    , "callbackFunc":function(data){
                        $("#gridMaster").data("kendoExtGrid").dataSource.read();
                    }
                }
            }
        });
}

function selectlaborCodeSearchPopupWindow(){

    laborSearchPopup = dms.window.popup({
        windowId:"laborCodeSearchPopupWindow"
        ,height:400
        , title:"<spring:message code = 'ser.title.lbrCdSearch'/>"    //
        , content:{
            url:"<c:url value='/ser/cmm/popup/selectLaborCodePopup.do'/>"
            , data:{
                 "autoBind":false
                ,"sLtsModelCd":"HF**A"
                , "callbackFunc":function(data){
                }
            }
        }
    });
}

$(document).ready( function(){

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
            //initAll();
            $("#gridMaster").data("kendoExtGrid").dataSource.page(1);
            $("#gridDetail").data("kendoExtGrid").dataSource.data([]);
        }
    });

    chageSearch = function(){

        $("#btnSearch").click();

        //btn_enableYn
        var dstinCd = $("#sDstinCd").data("kendoExtDropDownList").value();

        if(dstinCd != "H" && dstinCd != "E"){ // 표준, 기타
            $(".btn_enableYn").attr("style","display:inline;");
        }else{
            //$(".btn_enableYn").attr("style","display:none;");
            $(".btn_enableYn").attr("style","display:inline;");
        }
        $("#btnDel").data("kendoButton").enable((dstinCd == "E" || dstinCd == "G" ) ? true : false);

        setButtonEnable("N");

    };

    // 공임 조회 팝업 테스트하기위해 임시로 버튼추가

    $("#btnLaborSearchPopup").kendoButton({
        click:function(e){
            selectlaborCodeSearchPopupWindow();
        }
    });

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
            console.log($("#sLbrNm").val());
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

    //버튼 - 저장
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

    //버튼 - 삭제
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


    /** 디테일그리드 라인 추가버튼 **/
    $("#btnAdd").kendoButton({

        click:function (e){
            var grid = $("#gridDetail").data("kendoExtGrid").dataSource;
            grid.insert(0,{
                 "dlrCd": $("#dlrCd").val()
                ,"ltsModelCd":""
                ,"ltsModelNm":""
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

    /**공임취소 **/
    /* $("#btnCancel").kendoButton({
        click:function(e) {
            $('#gridDetail').data('kendoExtGrid').cancelChanges();

        }
    }); */

    /** 디테일그리드 라인 저장버튼 **/
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
                console.log("formSaveData : ",formSaveData);

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
                           console.log(gridMaster.select());

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


         var bFlag = ( $("#dstinCd").val() == "H" ) ? false:true;
         var fieldFlag = ( $("#dstinCd").val() == "D" ) ? false:true;
         var dstinCd = $("#dstinCd").val();

        switch(sFlag){
            case "Y" :
                $("#btnAdd").data("kendoButton").enable(bFlag);
                $("#btnSave").data("kendoButton").enable(true);
                $("#btnDelete").data("kendoButton").enable(bFlag);
                $("#btnDetailSave").data("kendoButton").enable(bFlag);
                $("#btnDel").data("kendoButton").enable((dstinCd == "E" || dstinCd == "G" ) ? true : false);
//                 $("#btnCancel").data("kendoButton").enable(true);
                      break;
            case "N" :
                $("#btnAdd").data("kendoButton").enable(false);
                $("#btnSave").data("kendoButton").enable(false);
                $("#btnDelete").data("kendoButton").enable(false);
                $("#btnDetailSave").data("kendoButton").enable(false);
                $("#btnDel").data("kendoButton").enable(false);
//                 $("#btnCancel").data("kendoButton").enable(false);
                      break;
            default :
                $("#btnAdd").data("kendoButton").enable(false);
                $("#btnSave").data("kendoButton").enable(false);
                $("#btnDelete").data("kendoButton").enable(false);
                $("#btnDetailSave").data("kendoButton").enable(false);
                $("#btnDel").data("kendoButton").enable(false);
//                 $("#btnCancel").data("kendoButton").enable(false);
                     break;
        }


        if(fieldFlag){ //fieldFlag =  true. 자체정의 아닐 때.
            $("#lbrChnNm").attr("readonly",fieldFlag).addClass("form_readonly");
            $("#lbrEnNm").attr("readonly",fieldFlag).addClass("form_readonly");
            $("#lbrTp").data("kendoExtDropDownList").enable(true);
//             $("#lbrTp").attr("readonly",fieldFlag).addClass("form_readonly");
//             $("#lbrTp").data("kendoExtDropDownList").enable(false);
        }else{ //fieldFlag = false.자체정의
            $("#lbrChnNm").attr("readonly",fieldFlag).removeClass("form_readonly");
            $("#lbrEnNm").attr("readonly",fieldFlag).removeClass("form_readonly");
            $("#lbrTp").data("kendoExtDropDownList").enable(true);
        }

    };


    /** 저장 필수값 체크 **/
    saveCheckValue = function (e){


        var msgText;
        var result = true;

        var grid = $("#gridDetail").data("kendoExtGrid");
        var resultCnt = 0;

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
            if(data.lbrHm <= 0){
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

        }else if( isRegCheck() == false){
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
                       ,lbrTp:{type:"string" }
                       ,dstinCd:{type:"string", editable:false }
                       ,brandCd:{type:"string", editable:false }
                       ,lbrEnNm:{type:"string" }
                       ,lbrChnNm:{type:"string" }
                       ,remark:{type:"string" }
                       ,lbrCdTp:{type:"string" }
                    }

                 }//model
           }//schema
        }//dataSource
        ,editable:true
        ,scrollable:true
        ,autoBind:false
        ,selectable:"row"
        ,height:200
        ,filterable:false                 // 필터링 기능 사용안함
        ,dataBound:function(e) {
            if(selectedYn ){
                e.sender.select(e.sender.tbody.find("tr")[gridSelectedRow]);
            }
        }
        ,change:function (e){
            var selectedVal = this.dataItem(this.select());
            var sDstinCd = selectedVal.dstinCd;
            var sBrandCd = selectedVal.brandCd;
            var sLbrCd   = selectedVal.lbrCd;
            var sLbrTp   = selectedVal.lbrTp;
            var sDlrCd   = selectedVal.dlrCd;

            console.log(JSON.stringify(selectedVal.lbrTp));


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
                   ,{field:"dstinCd", title:"<spring:message code='ser.lbl.gubun' />", width:80, sortable:false
                       ,attributes:{"class":"ac"}
                       ,template:"#= setDstinMap(dstinCd) #"
                    }//공임구분
                   ,{field:"lbrTp", title:"<spring:message code='ser.lbl.lbrTp' />", width:80, sortable:true
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
                   }//정비유형
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
                   ,{field:"brandCd", title:"<spring:message code='ser.lbl.brand' />", width:80, sortable:true, attributes:{"class":"al"}, hidden:true}
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
                       ,ltsModelNm:{type:"string" }
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
        ,indvColumnVisible:true             //컬럼 보이기/감추기 개인화 적용. default:true
        ,indvColumnReorderable:true         //컬럼순서 변경 개인화 적용. default:true
        ,indvColumnRows:10                  //컬럼개인화 컨텍스트 메뉴를 구성을 위한 출력 갯수 default:10
        ,multiSelectWithCheckbox:true       //멀티선택 적용. default:false
        ,multiSelectLocked:false            //멀티선택 컬럼 틀고정 default:false
        ,visibleFilterRow:false             //필터로우 출력여부, default:false
        ,height:300
        ,pageable:false
        ,scrollable:true
        ,sortable:false
        ,autoBind:false
        ,edit:function(e){
            var fieldName = $(e.container.find("input")[1]).attr("name");

            if(fieldName=="ltsModelNm" )this.closeCell();


            if ($("#dstinCd").val() == "H") {
                 if(fieldName=="ltsModelCd" ||fieldName=="ltsModelNm" ||
                         fieldName=="lbrHm" ||fieldName=="validStartDt" || fieldName=="validEndDt"){
                     this.closeCell();
                 }
             }
         }
        ,change:function(e){
            var selectedVal = this.dataItem(this.select());
        }
        ,columns:[
                    {field:"ltsModelCd", title:"<spring:message code='ser.lbl.ltsModelCd' />", width:150, sortable:true
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
                   ,{field:"ltsModelNm", title:"<spring:message code='ser.lbl.ltsModelNm' />", width:250, sortable:false, attributes:{"class":"al"}} //LTS MODEL 명
                   ,{field:"lbrHm", title:"<spring:message code='ser.lbl.lbrHm' />", width:100, sortable:false
                       , attributes:{"class":"ar"}
                       , editor:function(container, options){
                           $('<input required name="lbrHm" min=0 maxLength=3 data-name="<spring:message code="ser.lbl.lbrTime" />" data-bind="value:' + options.field + '"/>')
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
                   ,{field:"allocLbrHm", title:"<spring:message code='ser.lbl.dstbHm' />", width:100, sortable:false
                       , attributes:{"class":"ar"}
                       , editor:function(container, options){
                           $('<input required name="allocLbrHm" min=0 maxLength=3 data-name="<spring:message code="ser.lbl.dstbHm" />" data-bind="value:' + options.field + '"/>')
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
                   ,{field:"payLbrHm", title:"<spring:message code='ser.lbl.chargeLbr' />", width:100, sortable:false
                       , attributes:{"class":"ar"}
                       , editor:function(container, options){
                           $('<input required name="payLbrHm" min=0 maxLength=3 data-name="<spring:message code="ser.lbl.chargeLbr" />" data-bind="value:' + options.field + '"/>')
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
                   }//유료공임
                   ,{field:"lbrCnt", title:"<spring:message code='ser.lbl.rpipHmDegree' />", width:100, sortable:false
                       , attributes:{"class":"ar"}
                       , editor:function(container, options){
                           $('<input required name="lbrCnt" min=0 maxLength=3 data-name="<spring:message code="ser.lbl.lbrTime" />" data-bind="value:' + options.field + '"/>')
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
                   }//공임계수
                   ,{field:"diffVal", title:"<spring:message code='ser.lbl.difcDegree' />", width:100, sortable:false
                       , attributes:{"class":"ar"}
                       , editor:function(container, options){
                           $('<input required name="diffVal" min=0 maxLength=3 data-name="<spring:message code="ser.lbl.lbrTime" />" data-bind="value:' + options.field + '"/>')
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
                   ,{field:"serCnt", title:"<spring:message code='ser.lbl.serCnt' />", width:100, sortable:false
                       , attributes:{"class":"ar"}
                       , editor:function(container, options){
                           $('<input required name="serCnt" min=0 maxLength=3 data-name="<spring:message code="ser.lbl.lbrTime" />" data-bind="value:' + options.field + '"/>')
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

});
// document.ready 종료

</script>
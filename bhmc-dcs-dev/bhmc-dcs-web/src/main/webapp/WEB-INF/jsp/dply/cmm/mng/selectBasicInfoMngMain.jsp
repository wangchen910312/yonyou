<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>


<!-- 날짜 -->
<dms:configValue code='dateFormat' var="_dateFormat" />
<dms:configValue code='dateTimeFormat' var="_dateTimeFormat" />

<script type="text/javascript">
//시스템 날짜 정보 가져오기.
var vDateTimeFormat = "${_dateTimeFormat}";

//yyyy-MM-dd HH:mm:ss
var vDtyyyyMMddHHmmss = vDateTimeFormat;

//yyyy-MM-dd HH:mm
var vDtyyyyMMddHHmm = vDateTimeFormat.substring(0,16);
// yyyy-MM-dd
//var vDtyyyyMMdd = vDateTimeFormat.substring(0,10);
var vDtyyyyMMdd = "${_dateFormat}";

// HH:mm
var vDtHHmm = vDateTimeFormat.substring(11,16);


// 현재일자
var toDay = "${toDay}";
// 해당월 1일
//var oneDay = toDay.substring(0, 8) + "01";
var oneDay = "${oneDay}";

//공통 PROPERTY LIST
var cmmPrtyListObj = {};
<c:forEach var="obj" items="${cmmPrtyDS}">
    $.extend(cmmPrtyListObj, {"${obj.prtyNm}":"${obj.prtyVal}"});
</c:forEach>

//Notification Type:COM033
var notificationTpList = [];

<c:forEach var="obj" items="${notificationTpDS}">
    notificationTpList.push({cmmCdNm:"${obj.cmmCdNm}", cmmCd:"${obj.cmmCd}"});
</c:forEach>

var notificationTpArray = [];
$.each(notificationTpList, function(idx, obj){
    notificationTpArray[obj.cmmCd] = obj.cmmCdNm;
});



//REPOSITORY
var repositoryList = [];
<c:forEach var="obj" items="${repositoryDS}">
repositoryList.push({cmmCdNm:"${obj.repoUrlCont}", cmmCd:"${obj.repoUrlNm}"});
</c:forEach>

var repositoryArray = [];
$.each(repositoryList, function(idx, obj){
    repositoryArray[obj.cmmCd] = obj.cmmCdNm;
});

//DEPLOY서비스작업명령어코드:COM035
var operCmdTpList = [];
<c:forEach var="obj" items="${operCmdTpDS}">
    operCmdTpList.push({cmmCdNm:"${obj.cmmCdNm}", cmmCd:"${obj.cmmCd}"});
</c:forEach>

var operCmdTpArray = [];
$.each(operCmdTpList, function(idx, obj){
    operCmdTpArray[obj.cmmCd] = obj.cmmCdNm;
});

//PROPERTY파일타입코드:COM038
var prtyFileTpList = [];
<c:forEach var="obj" items="${prtyFileTpDS}">
prtyFileTpList.push({cmmCdNm:"${obj.cmmCdNm}", cmmCd:"${obj.cmmCd}"});
</c:forEach>

var prtyFileTpArray = [];
$.each(prtyFileTpList, function(idx, obj){
    prtyFileTpArray[obj.cmmCd] = obj.cmmCdNm;
});
prtyFileTpArray[null] = "";

//REPOSITORY 작업명령어코드:COM042
var repositoryOperCmdTpList = [];
<c:forEach var="obj" items="${repositoryOperCmdTpDS}">
repositoryOperCmdTpList.push({cmmCdNm:"${obj.cmmCdNm}", cmmCd:"${obj.cmmCd}"});
</c:forEach>

var repositoryOperCmdTpArray = [];
$.each(repositoryOperCmdTpList, function(idx, obj){
    repositoryOperCmdTpArray[obj.cmmCd] = obj.cmmCdNm;
});


</script>


<form id="syncCommandSendReceiveHistoryForm" name="syncCommandSendReceiveHistoryForm" method="POST" onsubmit="return false;">
<!-- Sync Command Send Receive History List 조회 -->
<section class="group">
    <!-- 조회 조건 타이틀 시작 -->
    <div class="header_area">
        <!-- <h1 class="title_basic"><spring:message code="cmm.title.messageSourceMng" /></h1> -->
        <h1 class="title_basic"><spring:message code='global.title.deploySystemInfo' /></h1>
        <div class="btn_right">
            <dms:access viewId="VIEW-I-12352" hasPermission="${dms:getPermissionMask('READ')}">
                <button id="btnReloadProperty" type="button" class="btn_m"><spring:message code='global.btn.refresh' /></button>
            </dms:access>
        </div>
    </div>
    <!-- 조회 조건 타이틀 종료 -->

    <!-- 조회 조건 시작 -->

    <div id="tabstrip" class="tab_area">
        <!-- 탭메뉴 -->
        <ul>
            <li class="k-state-active"><spring:message code='global.title.systemPropertyReg' /></li>
            <li><spring:message code='global.title.repositoryReg' /></li>
            <li><spring:message code='global.title.messageTemplateReg' /></li>
            <li><spring:message code='global.title.notificationReceiverReg' /></li>
            <li><spring:message code='global.title.simulationServerReg' /></li>
            <li><spring:message code='global.title.appInfoReg' /></li>
        </ul>

        <!-- 시스템Property등록 시작 -->
        <div>
            <section class="group">
                <!-- Property 그리드 기능버튼 -->
                <div class="header_area">
                    <!--  <h2 class="title_basic">시스템 Property</h2>  -->
                    <div class="btn_right">
                        <dms:access viewId="VIEW-I-12351" hasPermission="${dms:getPermissionMask('READ')}">
                            <button type="button" class="btn_s" id="btnSearchProperty"><spring:message code='global.btn.search' /></button>
                        </dms:access>
                        <dms:access viewId="VIEW-I-12350" hasPermission="${dms:getPermissionMask('READ')}">
                            <button type="button" class="btn_s" id="btnSaveProperty"><spring:message code='global.btn.save' /></button>
                        </dms:access>
                        <dms:access viewId="VIEW-I-12349" hasPermission="${dms:getPermissionMask('READ')}">
                            <button type="button" class="btn_s" id="btnAddProperty"><spring:message code='global.btn.rowAdd' /></button>
                        </dms:access>
                        <dms:access viewId="VIEW-I-12348" hasPermission="${dms:getPermissionMask('READ')}">
                            <button type="button" class="btn_s" id="btnDelProperty"><spring:message code='global.btn.rowDel' /></button>
                        </dms:access>
                        <dms:access viewId="VIEW-I-12347" hasPermission="${dms:getPermissionMask('READ')}">
                            <button type="button" class="btn_s" id="btnCancelProperty"><spring:message code='global.btn.cancel' /></button>
                        </dms:access>
                    </div>
                </div>
                <!-- //Property 그리드 기능버튼 -->

                <div class="table_grid">
                    <div id="propertyGrid"></div>
                </div>

            </section>


        </div>
        <!-- 시스템Property등록 끝 -->

        <!-- Repository 등록 시작 -->
        <div>
            <section class="group">
                <!-- Repository 그리드 기능버튼 -->
                <div class="header_area">
                    <div class="btn_right">
                        <dms:access viewId="VIEW-I-12346" hasPermission="${dms:getPermissionMask('READ')}">
                            <button type="button" class="btn_s" id="btnSearchRepository"><spring:message code='global.btn.search' /></button>
                        </dms:access>
                        <dms:access viewId="VIEW-I-12345" hasPermission="${dms:getPermissionMask('READ')}">
                            <button type="button" class="btn_s" id="btnSaveRepository"><spring:message code='global.btn.save' /></button>
                        </dms:access>
                        <dms:access viewId="VIEW-I-12344" hasPermission="${dms:getPermissionMask('READ')}">
                            <button type="button" class="btn_s" id="btnAddRepository"><spring:message code='global.btn.rowAdd' /></button>
                        </dms:access>
                        <dms:access viewId="VIEW-I-12343" hasPermission="${dms:getPermissionMask('READ')}">
                            <button type="button" class="btn_s" id="btnDelRepository"><spring:message code='global.btn.rowDel' /></button>
                        </dms:access>
                        <dms:access viewId="VIEW-I-12342" hasPermission="${dms:getPermissionMask('READ')}">
                            <button type="button" class="btn_s" id="btnCancelRepository"><spring:message code='global.btn.cancel' /></button>
                        </dms:access>
                    </div>
                </div>
                <!-- //Repository 그리드 기능버튼 -->

                <div class="table_grid">
                    <div id="repositoryGrid"></div>
                </div>
            </section>
        </div>
        <!-- Repository 등록 끝 -->

        <!-- Message Template 등록 시작 -->
        <div>
            <section class="group">
                <!-- Message Template 그리드 기능버튼 -->
                <div class="header_area">
                    <div class="btn_right">
                        <dms:access viewId="VIEW-I-12341" hasPermission="${dms:getPermissionMask('READ')}">
                            <button type="button" class="btn_s" id="btnSearchMesgTmpl"><spring:message code='global.btn.search' /></button>
                        </dms:access>
                        <dms:access viewId="VIEW-I-12340" hasPermission="${dms:getPermissionMask('READ')}">
                            <button type="button" class="btn_s" id="btnSaveMesgTmpl"><spring:message code='global.btn.save' /></button>
                        </dms:access>
                        <dms:access viewId="VIEW-I-12339" hasPermission="${dms:getPermissionMask('READ')}">
                            <button type="button" class="btn_s" id="btnAddMesgTmpl"><spring:message code='global.btn.rowAdd' /></button>
                        </dms:access>
                        <dms:access viewId="VIEW-I-12338" hasPermission="${dms:getPermissionMask('READ')}">
                            <button type="button" class="btn_s" id="btnDelMesgTmpl"><spring:message code='global.btn.rowDel' /></button>
                        </dms:access>
                        <dms:access viewId="VIEW-I-12337" hasPermission="${dms:getPermissionMask('READ')}">
                            <button type="button" class="btn_s" id="btnCancelMesgTmpl"><spring:message code='global.btn.cancel' /></button>
                        </dms:access>
                    </div>
                </div>
                <!-- //Message Template 그리드 기능버튼 -->

                <div class="table_grid">
                    <div id="mesgTmplGrid"></div>
                </div>

                <div class="clfix">
                    <section class="content_left" style="width:400px;">

                        <div class="table_form mt10">
                            <table>
                                <caption></caption>
                                <colgroup>
                                    <col style="width:40%;">
                                    <col style="width:60%;">
                                </colgroup>
                                <tbody>
                                    <tr>
                                        <th scope="row"><spring:message code='global.lbl.messageCd' /></th>
                                        <td>
                                            <input id="mesgCd" name="mesgCd" class="form_input" data-json-obj="true" readonly >
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row"><spring:message code='global.title.mesgGrpCd' /></th>
                                        <td>
                                            <input id="mesgGrpCd" name="mesgGrpCd" class="form_comboBox" data-json-obj="true" readonly >
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row"><spring:message code='global.lbl.messageNm' /></th>
                                        <td>
                                            <input id="mesgNm" name="mesgNm" class="form_input" data-json-obj="true" readonly >
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row"><spring:message code='global.lbl.delYn' /></th>
                                        <td>
                                            <input id="delYn" name="delYn" class="form_comboBox" data-json-obj="true" readonly >
                                        </td>
                                    </tr>

                                </tbody>
                            </table>
                        </div>
                    </section>

                    <section class="content_right"  style="margin-left:410px;">
                        <div class="table_form mt10">
                            <table>
                                <caption></caption>
                                <colgroup>
                                    <col style="width:10%;">
                                    <col style="width:90%;">
                                </colgroup>
                                <tbody>
                                    <tr>
                                        <th scope="row"><spring:message code='global.lbl.message' /></th>
                                        <td>
                                            <textarea id="mesgBodyCont" name="mesgBodyCont" rows="20" cols="30" placeholder="" class="form_textarea" data-json-obj="true" style="height:200px;"></textarea>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </section>
                </div>


            </section>
        </div>
        <!-- Message Template 등록 끝 -->

        <!-- Notification Receiver 등록 시작 -->
        <div>
            <section class="group">
                <!-- Notification Receiver 그리드 기능버튼 -->
                <div class="header_area">
                    <div class="btn_right">
                        <dms:access viewId="VIEW-I-12336" hasPermission="${dms:getPermissionMask('READ')}">
                            <button type="button" class="btn_s" id="btnSearchNotiReceiver"><spring:message code='global.btn.search' /></button>
                        </dms:access>
                        <dms:access viewId="VIEW-I-12335" hasPermission="${dms:getPermissionMask('READ')}">
                            <button type="button" class="btn_s" id="btnSaveNotiReceiver"><spring:message code='global.btn.save' /></button>
                        </dms:access>
                        <dms:access viewId="VIEW-I-12334" hasPermission="${dms:getPermissionMask('READ')}">
                            <button type="button" class="btn_s" id="btnAddNotiReceiver"><spring:message code='global.btn.rowAdd' /></button>
                        </dms:access>
                        <dms:access viewId="VIEW-I-12333" hasPermission="${dms:getPermissionMask('READ')}">
                            <button type="button" class="btn_s" id="btnDelNotiReceiver"><spring:message code='global.btn.rowDel' /></button>
                        </dms:access>
                        <dms:access viewId="VIEW-I-12332" hasPermission="${dms:getPermissionMask('READ')}">
                            <button type="button" class="btn_s" id="btnCancelNotiReceiver"><spring:message code='global.btn.cancel' /></button>
                        </dms:access>
                    </div>
                </div>
                <!-- //Notification Receiver 그리드 기능버튼 -->

                <div class="table_grid">
                    <div id="notiReceiverGrid"></div>
                </div>
            </section>
        </div>
        <!-- Notification Receiver 등록 끝 -->

        <!-- Notification Receiver 등록 시작 -->
        <div>
            <section class="group">
                <!-- Notification Receiver 그리드 기능버튼 -->
                <div class="header_area">
                    <div class="btn_right">
                        <dms:access viewId="VIEW-I-12331" hasPermission="${dms:getPermissionMask('READ')}">
                            <button type="button" class="btn_s" id="btnSearchSimulationServer"><spring:message code='global.btn.search' /></button>
                        </dms:access>
                        <dms:access viewId="VIEW-I-12330" hasPermission="${dms:getPermissionMask('READ')}">
                            <button type="button" class="btn_s" id="btnSaveSimulationServer"><spring:message code='global.btn.save' /></button>
                        </dms:access>
                        <dms:access viewId="VIEW-I-12329" hasPermission="${dms:getPermissionMask('READ')}">
                            <button type="button" class="btn_s" id="btnAddSimulationServer"><spring:message code='global.btn.rowAdd' /></button>
                        </dms:access>
                        <dms:access viewId="VIEW-I-12328" hasPermission="${dms:getPermissionMask('READ')}">
                            <button type="button" class="btn_s" id="btnDelSimulationServer"><spring:message code='global.btn.rowDel' /></button>
                        </dms:access>
                        <dms:access viewId="VIEW-I-12327" hasPermission="${dms:getPermissionMask('READ')}">
                            <button type="button" class="btn_s" id="btnCancelSimulationServer"><spring:message code='global.btn.cancel' /></button>
                        </dms:access>
                    </div>
                </div>
                <!-- //Notification Receiver 그리드 기능버튼 -->

                <div class="table_grid">
                    <div id="simulationServerGrid"></div>
                </div>
            </section>
        </div>
        <!-- Notification Receiver 등록 끝 -->

 		<!-- App정보 등록 시작 -->
        <div>
            <section class="group">
                <!-- Notification Receiver 그리드 기능버튼 -->
                <div class="header_area">
                    <div class="btn_right">
                        <dms:access viewId="VIEW-I-12326" hasPermission="${dms:getPermissionMask('READ')}">
                            <button type="button" class="btn_s" id="btnSearchAppInfo"><spring:message code='global.btn.search' /></button>
                        </dms:access>
                        <dms:access viewId="VIEW-I-12325" hasPermission="${dms:getPermissionMask('READ')}">
                            <button type="button" class="btn_s" id="btnSaveAppInfo"><spring:message code='global.btn.save' /></button>
                        </dms:access>
                        <dms:access viewId="VIEW-I-12324" hasPermission="${dms:getPermissionMask('READ')}">
                            <button type="button" class="btn_s" id="btnAddAppInfo"><spring:message code='global.btn.rowAdd' /></button>
                        </dms:access>
                        <dms:access viewId="VIEW-I-12323" hasPermission="${dms:getPermissionMask('READ')}">
                            <button type="button" class="btn_s" id="btnDelAppInfo"><spring:message code='global.btn.rowDel' /></button>
                        </dms:access>
                        <dms:access viewId="VIEW-I-12322" hasPermission="${dms:getPermissionMask('READ')}">
                            <button type="button" class="btn_s" id="btnCancelAppInfo"><spring:message code='global.btn.cancel' /></button>
                        </dms:access>
                    </div>
                </div>
                <!-- //Notification Receiver 그리드 기능버튼 -->

                <div class="table_grid">
                    <div id="appInfoGrid"></div>
                </div>
            </section>
        </div>
        <!-- App정보 등록 끝 -->


    </div>
    <!-- TabStrip 끝 -->


</section>
</form>


<script type="text/javascript">
var indexOfPropertyGrid         = 0;
var indexOfRepositoryGrid       = 0;
var indexOfMesgTmplGrid         = 0;
var indexOfNotiReceiverGrid     = 0;
var indexOfSimulationServerGrid = 0;
var indexOfAppinfoGrid = 0;

var gv_messageGridModel_currUid = null;

/******************************************
 * 함수영역 - start
******************************************/




/******************************************
 * 함수영역 - end
******************************************/

$(document).ready(function() {

    $("#tabstrip").kendoExtTabStrip({
        animation:false
        ,select:function(e) {
            var idx = $(e.item).index();

            if(idx == 0) {  // 기본정보

            }
        }
    });

    $("#btnReloadProperty").kendoButton({
        click:function(e) {
            reloadSharedMemory();
        }
    });

    //버튼 - 조회
    $("#btnSearchProperty").kendoButton({
        click:function(e) {
            $('#propertyGrid').data('kendoExtGrid').dataSource.read();
        }
    });

    $("#btnSaveProperty").kendoButton({
        click:function(e) {

            var grid = $("#propertyGrid").data("kendoExtGrid");

            // 저장하시겠습니까?
            if(!confirm("<spring:message code='global.lbl.save' var='globalLblUpdate' /><spring:message code='global.info.cnfrmMsg' arguments='${globalLblUpdate}' />")){
                return;
            }

            var saveData = grid.getCUDData("insertList", "updateList", "deleteList");
            if (grid.cudDataLength == 0) {
                //변경된 정보가 없습니다.
                dms.notification.info("<spring:message code='global.info.required.change'/>");
                return;
            }

            if (grid.gridValidation()) {
                $.ajax({
                    url:"<c:url value='/dply/cmm/mng/multiCmmPrty.do' />"
                    ,data:JSON.stringify(saveData)
                    ,type:'POST'
                    ,dataType:'json'
                    ,contentType:'application/json'
                    ,error:function(jqXHR,status,error) {

                        dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                    }
                    ,success:function(jqXHR, textStatus) {

                        grid.dataSource._destroyed = [];
//                         grid.dataSource.page(1);
                        grid.dataSource.read();


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

    $("#btnAddProperty").kendoButton({
        click:function(e) {
            $('#propertyGrid').data('kendoExtGrid').dataSource.insert(0, {
                "prtyNm"     :""
                ,"prtyVal"   :""
                ,"prtyCont"  :""
                ,"prtyContZh":""
                ,"prtyType"  :""
            });
        }
    });

    //
    $("#btnDelProperty").kendoButton({
        click:function(e) {
            var grid = $("#propertyGrid").data("kendoExtGrid");
            var rows = grid.select();

            rows.each(function(index, row) {
                grid.removeRow(row);
            });
        }
    });

    $("#btnCancelProperty").kendoButton({
        click:function(e) {
            $('#propertyGrid').data('kendoExtGrid').cancelChanges();
        }
    });

    //그리드 설정
    $("#propertyGrid").kendoExtGrid({
        dataSource:{
             transport:{
                read:{
                    url:"<c:url value='/dply/cmm/mng/selectCmmPrtyList.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};

//                         params["recordCountPerPage"] = options.pageSize;
//                         params["pageIndex"] = options.page;
//                         params["firstIndex"] = options.skip;
//                         params["lastIndex"] = options.skip + options.take;
//                         params["sort"] = options.sort;

//                         params["sDlrCd"]            = $("#sDlrCd").val();

                        return kendo.stringify(params);

                    } else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,schema:{
                model:{
                    id:"prtyNm"
                    ,fields:{
                        rnum      :{type:'number', editable:false}
                        ,prtyNm   :{type:'string', editable:true}
                        ,prtyVal  :{type:'string', editable:true}
                        ,prtyCont :{type:'string', editable:true}
                        ,prtyContZh:{type:'string', editable:true}
                        ,prtyType :{type:'string', editable:true}
                        ,regDt    :{type:'date', editable:false}
                        ,updtDt   :{type:'date', editable:false}

                    }
                }
            }
            ,requestEnd:function(e) {

            }
        }
        ,height:450
        ,autoBind:false
        ,selectable:"row"
        ,pageable:false
        ,multiSelectWithCheckbox:true
        ,editableOnlyNew:true
        ,editableOnlyNewExcludeColumns:["prtyVal","prtyCont","prtyContZh","prtyType"]
        ,columns:[
            {field:"rnum", title:"<spring:message code='global.lbl.no' />", width:50, sortable:false
                ,attributes:{"class":"ac"}
            }
            ,{field:"prtyNm", title:"<spring:message code='global.lbl.prtyNm' />", width:250
            }
            ,{field:"prtyVal", title:"<spring:message code='global.lbl.prtyVal' />", width:250
            }
            ,{field:"prtyCont", title:"<spring:message code='global.lbl.prtyCont' />", width:340
            }
            ,{field:"prtyContZh", title:"<spring:message code='global.lbl.prtyCont' />", width:340
            }
            ,{field:"prtyType", title:"Type", width:100
            }
            ,{title:""}
        ]
        ,change:function(e) {
//          if(!e.sender.dataItem(e.sender.select()).isNew()) {
            if(e.sender.dataItem(e.sender.select()) != null) {
                var selectedVal = this.dataItem(this.select());

//                 $('#sendReceiveTrxId').val(selectedVal.sendReceiveTrxId);


            } else {

            }


        }
        ,dataBinding:function(e) {

        }
        ,dataBound:function(e) {
            var grid = e.sender;
            var row = grid.tbody.find("tr:eq(" + indexOfPropertyGrid +")");
            if(row.length > 0) {
                grid.select(row);
            } else {

            }

        }
    });

    var propertyGrid = $('#propertyGrid').data('kendoExtGrid');

    $(propertyGrid.tbody).on("click", "td", function (e) {
        var row = $(this).closest("tr");
        console.log(propertyGrid.dataItem(row));
        var rowIdx = $("tr", propertyGrid.tbody).index(row);
        var colIdx = $("td", row).index(this);

        indexOfPropertyGrid = rowIdx;
    });




    //버튼 - 조회
    $("#btnSearchRepository").kendoButton({
        click:function(e) {
            $('#repositoryGrid').data('kendoExtGrid').dataSource.read();
        }
    });

    $("#btnSaveRepository").kendoButton({
        click:function(e) {

            var grid = $("#repositoryGrid").data("kendoExtGrid");

            // 저장하시겠습니까?
            if(!confirm("<spring:message code='global.lbl.save' var='globalLblUpdate' /><spring:message code='global.info.cnfrmMsg' arguments='${globalLblUpdate}' />")){
                return;
            }

            var saveData = grid.getCUDData("insertList", "updateList", "deleteList");
            if (grid.cudDataLength == 0) {
                //변경된 정보가 없습니다.
                dms.notification.info("<spring:message code='global.info.required.change'/>");
                return;
            }

            if (grid.gridValidation()) {
                $.ajax({
                    url:"<c:url value='/dply/cmm/mng/multiRepository.do' />"
                    ,data:JSON.stringify(saveData)
                    ,type:'POST'
                    ,dataType:'json'
                    ,contentType:'application/json'
                    ,error:function(jqXHR,status,error) {

                        dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                    }
                    ,success:function(jqXHR, textStatus) {

                        grid.dataSource._destroyed = [];
//                         grid.dataSource.page(1);
                        grid.dataSource.read();


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

    $("#btnAddRepository").kendoButton({
        click:function(e) {
            $('#repositoryGrid').data('kendoExtGrid').dataSource.insert(0, {
                "repoUrlNm"   :""
                ,"repoUrlCont" :""
            });
        }
    });

    //
    $("#btnDelRepository").kendoButton({
        click:function(e) {
            var grid = $("#repositoryGrid").data("kendoExtGrid");
            var rows = grid.select();

            rows.each(function(index, row) {
                grid.removeRow(row);
            });
        }
    });

    $("#btnCancelRepository").kendoButton({
        click:function(e) {
            $('#repositoryGrid').data('kendoExtGrid').cancelChanges();
        }
    });

    //그리드 설정
    $("#repositoryGrid").kendoExtGrid({
        dataSource:{
             transport:{
                read:{
                    url:"<c:url value='/dply/cmm/mng/selectRepository.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};

//                         params["recordCountPerPage"] = options.pageSize;
//                         params["pageIndex"] = options.page;
//                         params["firstIndex"] = options.skip;
//                         params["lastIndex"] = options.skip + options.take;
//                         params["sort"] = options.sort;

//                         params["sDlrCd"]            = $("#sDlrCd").val();

                        return kendo.stringify(params);

                    } else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,schema:{
                model:{
                    id:"seq"
                    ,fields:{
                        seq         :{type:'number', editable:false}
                        ,repoUrlNm  :{type:'string', editable:true}
                        ,repoUrlCont:{type:'string', editable:true}
                        ,regDt      :{type:'date', editable:false}
                        ,updtDt     :{type:'date', editable:false}

                    }
                }
            }
            ,requestEnd:function(e) {

            }
        }
        ,height:450
        ,autoBind:false
        ,selectable:"row"
        ,pageable:false
        ,multiSelectWithCheckbox:true
        ,editableOnlyNew:true
        ,editableOnlyNewExcludeColumns:["repoUrlNm","repoUrlCont"]
        ,columns:[
            {field:"seq", title:"<spring:message code='global.lbl.seq' />", width:60, sortable:false
                ,attributes:{"class":"ac"}
            }
            ,{field:"repoUrlNm", title:"<spring:message code='global.lbl.repoUrlNm' />", width:400
            }
            ,{field:"repoUrlCont", title:"<spring:message code='global.lbl.repoUrlCont' />", width:250
            }
            ,{title:""}
        ]
        ,change:function(e) {
//          if(!e.sender.dataItem(e.sender.select()).isNew()) {
            if(e.sender.dataItem(e.sender.select()) != null) {
                var selectedVal = this.dataItem(this.select());

//                 $('#sendReceiveTrxId').val(selectedVal.sendReceiveTrxId);


            } else {

            }


        }
        ,dataBinding:function(e) {

        }
        ,dataBound:function(e) {
            var grid = e.sender;
            var row = grid.tbody.find("tr:eq(" + indexOfRepositoryGrid +")");
            if(row.length > 0) {
                grid.select(row);
            } else {

            }

        }
    });

    var repositoryGrid = $('#repositoryGrid').data('kendoExtGrid');

    $(repositoryGrid.tbody).on("click", "td", function (e) {
        var row = $(this).closest("tr");
        var rowIdx = $("tr", repositoryGrid.tbody).index(row);
        var colIdx = $("td", row).index(this);

        indexOfRepositoryGrid = rowIdx;
    });



    //버튼 - 조회
    $("#btnSearchMesgTmpl").kendoButton({
        click:function(e) {
            $('#mesgTmplGrid').data('kendoExtGrid').dataSource.read();
        }
    });

    $("#btnSaveMesgTmpl").kendoButton({
        click:function(e) {

            var grid = $("#mesgTmplGrid").data("kendoExtGrid");

            // 저장하시겠습니까?
            if(!confirm("<spring:message code='global.lbl.save' var='globalLblUpdate' /><spring:message code='global.info.cnfrmMsg' arguments='${globalLblUpdate}' />")){
                return;
            }

            var saveData = grid.getCUDData("insertList", "updateList", "deleteList");
            if (grid.cudDataLength == 0) {
                //변경된 정보가 없습니다.
                dms.notification.info("<spring:message code='global.info.required.change'/>");
                return;
            }

            if (grid.gridValidation()) {
                $.ajax({
                    url:"<c:url value='/dply/cmm/mng/multiMessageTemplate.do' />"
                    ,data:JSON.stringify(saveData)
                    ,type:'POST'
                    ,dataType:'json'
                    ,contentType:'application/json'
                    ,error:function(jqXHR,status,error) {

                        dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                    }
                    ,success:function(jqXHR, textStatus) {

                        grid.dataSource._destroyed = [];
//                         grid.dataSource.page(1);
                        grid.dataSource.read();


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

    $("#btnAddMesgTmpl").kendoButton({
        click:function(e) {
            $('#mesgTmplGrid').data('kendoExtGrid').dataSource.insert(0, {
                "mesgCd"    :""
                ,"mesgGrpCd":""
                ,"delYn"    :"N"
                ,"mesgBodyCont":""
            });
        }
    });

    //
    $("#btnDelMesgTmpl").kendoButton({
        click:function(e) {
            var grid = $("#mesgTmplGrid").data("kendoExtGrid");
            var rows = grid.select();

            rows.each(function(index, row) {
                grid.removeRow(row);
            });
        }
    });

    $("#btnCancelMesgTmpl").kendoButton({
        click:function(e) {
            $('#mesgTmplGrid').data('kendoExtGrid').cancelChanges();
        }
    });

    //그리드 설정
    $("#mesgTmplGrid").kendoExtGrid({
        dataSource:{
             transport:{
                read:{
                    url:"<c:url value='/dply/cmm/mng/selectMessageTemplate.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};

//                         params["recordCountPerPage"] = options.pageSize;
//                         params["pageIndex"] = options.page;
//                         params["firstIndex"] = options.skip;
//                         params["lastIndex"] = options.skip + options.take;
//                         params["sort"] = options.sort;

//                         params["sDlrCd"]            = $("#sDlrCd").val();

                        return kendo.stringify(params);

                    } else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,schema:{
                model:{
                    id:"mesgCd"
                    ,fields:{
                        mesgCd       :{type:'string', editable:true, validation:{required:true}}
                        ,mesgGrpCd   :{type:'string', editable:true, validation:{required:true}}
                        ,mesgNm      :{type:'string', editable:true, validation:{required:true}}
                        ,mesgBodyCont:{type:'string', editable:true}
                        ,delYn       :{type:'string', editable:true, validation:{required:true}}
                        ,regDt       :{type:'date', editable:false}
                        ,updtDt      :{type:'date', editable:false}

                    }
                }
            }
            ,requestEnd:function(e) {

            }
        }
        ,height:250
        ,autoBind:false
        ,selectable:"row"
        ,pageable:false
        ,multiSelectWithCheckbox:true
        ,editableOnlyNew:true
        ,editableOnlyNewExcludeColumns:["mesgGrpCd","mesgNm","mesgBodyCont","delYn"]
        ,columns:[
            {field:"mesgCd", title:"<spring:message code='global.lbl.messageCd' />", width:90, sortable:false
                ,attributes:{"class":"ac"}
            }
            ,{field:"mesgGrpCd", title:"<spring:message code='global.title.mesgGrpCd' />", width:100
                ,attributes:{"class":"ac"}
                ,editor:function(container, options) {
                    $('<input required name="mesgGrpCd" data-bind="value:' + options.field + '"/>')
                    .appendTo(container)
                    .kendoExtDropDownList({
                        autoBind:true
                        ,dataSource:['I','E']
                        ,index:0
                    });
                    $('<span class="k-invalid-msg" data-for="resourceTp"></span>').appendTo(container);
                }
            }
            ,{field:"mesgNm", title:"<spring:message code='global.lbl.messageNm' />", width:250
            }
            ,{field:"mesgBodyCont", title:"<spring:message code='global.lbl.message' />", width:400
            }
            ,{field:"delYn", title:"<spring:message code='global.lbl.delYn' />", width:80
                ,attributes:{"class":"ac"}
                ,editor:function(container, options) {
                    $('<input required name="delYn" data-bind="value:' + options.field + '"/>')
                    .appendTo(container)
                    .kendoExtDropDownList({
                        autoBind:true
                        ,dataSource:['Y','N']
                        ,index:0
                    });
                    $('<span class="k-invalid-msg" data-for="resourceTp"></span>').appendTo(container);
                }
            }
            ,{title:""}
        ]
        ,change:function(e) {
            if(e.sender.dataItem(e.sender.select()) != null) {
                var selectedVal = this.dataItem(this.select());

                gv_messageGridModel_currUid = selectedVal.uid;

//                 $('#service_operCmdNm').data("kendoExtDropDownList").value(selectedVal.operCmdNm);
                $('#mesgCd').val(selectedVal.mesgCd);
                $('#mesgGrpCd').data("kendoExtDropDownList").value(selectedVal.mesgGrpCd);
                $('#mesgNm').val(selectedVal.mesgNm);
                $('#mesgBodyCont').val(selectedVal.mesgBodyCont);
                $('#delYn').data("kendoExtDropDownList").value(selectedVal.delYn);

                if(e.sender.dataItem(e.sender.select()).isNew()) {
                    $('#mesgCd').removeClass("form_readonly");
                    $('#mesgCd').attr("readonly", false);
                } else {
                    $('#mesgCd').addClass("form_readonly");
                    $('#mesgCd').attr("readonly", true);
                }

            } else {
//                 $('#service_operCmdNm').data("kendoExtDropDownList").value(null);
                $('#mesgCd').val(null);
                $('#mesgGrpCd').data("kendoExtDropDownList").value(null);
                $('#mesgNm').val(null);
                $('#mesgBodyCont').val(null);
                $('#delYn').data("kendoExtDropDownList").value(null);

            }

        }
        ,dataBinding:function(e) {

        }
        ,dataBound:function(e) {
            var grid = e.sender;
            var row = grid.tbody.find("tr:eq(" + indexOfMesgTmplGrid +")");
            if(row.length > 0) {
                grid.select(row);
            } else {

            }

        }

    });

    var mesgTmplGrid = $('#mesgTmplGrid').data('kendoExtGrid');

    $(mesgTmplGrid.tbody).on("click", "td", function (e) {
        var row = $(this).closest("tr");
        var rowIdx = $("tr", mesgTmplGrid.tbody).index(row);
        var colIdx = $("td", row).index(this);

        indexOfMesgTmplGrid = rowIdx;
    });



    // Message Group Code
    $("#mesgGrpCd").kendoExtDropDownList({
        dataSource:["", "I", "E"]
    });

    // Message 삭제 여부
    $("#delYn").kendoExtDropDownList({
        dataSource:["", "Y", "N"]
    });

    $("#mesgCd").on("change", function() {
        var grid = $("#mesgTmplGrid").data("kendoExtGrid");

        if(gv_messageGridModel_currUid == 'undefined' || gv_messageGridModel_currUid == null) return false;
        grid.dataSource.getByUid(gv_messageGridModel_currUid).set("mesgCd", this.value);

    });

    $("#mesgGrpCd").on("change", function() {
        var grid = $("#mesgTmplGrid").data("kendoExtGrid");

        if(gv_messageGridModel_currUid == 'undefined' || gv_messageGridModel_currUid == null) return false;
        grid.dataSource.getByUid(gv_messageGridModel_currUid).set("mesgGrpCd", this.value);

    });

    $("#mesgNm").on("change", function() {
        var grid = $("#mesgTmplGrid").data("kendoExtGrid");

        if(gv_messageGridModel_currUid == 'undefined' || gv_messageGridModel_currUid == null) return false;
        grid.dataSource.getByUid(gv_messageGridModel_currUid).set("mesgNm", this.value);

    });

    $("#mesgBodyCont").on("change", function() {
        var grid = $("#mesgTmplGrid").data("kendoExtGrid");

        if(gv_messageGridModel_currUid == 'undefined' || gv_messageGridModel_currUid == null) return false;
        grid.dataSource.getByUid(gv_messageGridModel_currUid).set("mesgBodyCont", this.value);

    });

    $("#delYn").on("change", function() {
        var grid = $("#mesgTmplGrid").data("kendoExtGrid");

        if(gv_messageGridModel_currUid == 'undefined' || gv_messageGridModel_currUid == null) return false;
        grid.dataSource.getByUid(gv_messageGridModel_currUid).set("delYn", this.value);

    });




    //버튼 - 조회
    $("#btnSearchNotiReceiver").kendoButton({
        click:function(e) {
            $('#notiReceiverGrid').data('kendoExtGrid').dataSource.read();
        }
    });

    $("#btnSaveNotiReceiver").kendoButton({
        click:function(e) {

            var grid = $("#notiReceiverGrid").data("kendoExtGrid");

            // 저장하시겠습니까?
            if(!confirm("<spring:message code='global.lbl.save' var='globalLblUpdate' /><spring:message code='global.info.cnfrmMsg' arguments='${globalLblUpdate}' />")){
                return;
            }

            var saveData = grid.getCUDData("insertList", "updateList", "deleteList");
            if (grid.cudDataLength == 0) {
                //변경된 정보가 없습니다.
                dms.notification.info("<spring:message code='global.info.required.change'/>");
                return;
            }

            if (grid.gridValidation()) {
                $.ajax({
                    url:"<c:url value='/dply/cmm/noti/multiNotificationReceiver.do' />"
                    ,data:JSON.stringify(saveData)
                    ,type:'POST'
                    ,dataType:'json'
                    ,contentType:'application/json'
                    ,error:function(jqXHR,status,error) {

                        dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                    }
                    ,success:function(jqXHR, textStatus) {

                        grid.dataSource._destroyed = [];
//                         grid.dataSource.page(1);
                        grid.dataSource.read();


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

    $("#btnAddNotiReceiver").kendoButton({
        click:function(e) {
            $('#notiReceiverGrid').data('kendoExtGrid').dataSource.insert(0, {
                "emailNm"   :""
            });
        }
    });

    //
    $("#btnDelNotiReceiver").kendoButton({
        click:function(e) {
            var grid = $("#notiReceiverGrid").data("kendoExtGrid");
            var rows = grid.select();

            rows.each(function(index, row) {
                grid.removeRow(row);
            });
        }
    });

    $("#btnCancelNotiReceiver").kendoButton({
        click:function(e) {
            $('#notiReceiverGrid').data('kendoExtGrid').cancelChanges();
        }
    });

    //그리드 설정
    $("#notiReceiverGrid").kendoExtGrid({
        dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/dply/cmm/noti/selectNotificationReceiver.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};

                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

//                         params["sSeq"] = $("#sSeq").val();
//                         params["sEmailNm"] = $("#sEmailNm").val();
//                         params["sHpNo"] = $("#sHpNo").val();

                        return kendo.stringify(params);

                    } else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,schema:{
                model:{
                    id:"seq"
                    ,fields:{
                         seq         :{type:"number", validation:{required:true}, editable:false}
                        ,emailNm     :{type:"string"}
                        ,hpNo        :{type:"string"}
                        ,deployNotiYn:{type:"string", validation:{required:true}}
                        ,systemNotiYn:{type:"string", validation:{required:true}}
                        ,delYn       :{type:"string", validation:{required:true}}
                        ,emailNotiYn :{type:"string", validation:{required:true}}
                        ,hpNotiYn    :{type:"string", validation:{required:true}}
                        ,regUsrId    :{type:"string"}
                        ,regDt       :{type:"date"}
                        ,updtUsrId   :{type:"string"}
                        ,updtDt      :{type:"date"}
                    }
                }
            }
            ,requestEnd:function(e) {
                $("#notiReceiverGrid").data("kendoExtGrid").dataSource.data([]);


            }
        }
        ,height:450
        ,autoBind:false
        ,selectable:"row"
        ,pageable:false
        ,multiSelectWithCheckbox:true
        ,editableOnlyNew:true
        ,editableOnlyNewExcludeColumns:["emailNm","hpNo","delYn","deployNotiYn","systemNotiYn","emailNotiYn","hpNotiYn"]
        ,columns:[
            {field:"seq", title:"<spring:message code='global.lbl.seq' />", width:30, sortable:false
                ,attributes:{"class":"ac"}
            }
            ,{field:"emailNm", title:"<spring:message code='global.lbl.emailNm' />", width:110
            }
            ,{field:"hpNo", title:"<spring:message code='global.lbl.hpNo' />", width:70
                ,attributes:{"class":"ac"}
            }
            ,{field:"delYn", title:"<spring:message code='global.lbl.delYn' />", width:40
                ,attributes:{"class":"ac"}
                ,editor:function(container, options) {
                    $('<input required name="delYn" data-bind="value:' + options.field + '"/>')
                    .appendTo(container)
                    .kendoExtDropDownList({
                        autoBind:true
                        ,dataSource:['Y','N']
                        ,index:0
                    });
                    $('<span class="k-invalid-msg" data-for="resourceTp"></span>').appendTo(container);
                }
            }
            ,{field:"deployNotiYn", title:"<spring:message code='global.lbl.deployNotiYn' />", width:70
                ,attributes:{"class":"ac"}
                ,editor:function(container, options) {
                    $('<input required name="deployNotiYn" data-bind="value:' + options.field + '"/>')
                    .appendTo(container)
                    .kendoExtDropDownList({
                        autoBind:true
                        ,dataSource:['Y','N']
                        ,index:0
                    });
                    $('<span class="k-invalid-msg" data-for="resourceTp"></span>').appendTo(container);
                }
            }
            ,{field:"systemNotiYn", title:"<spring:message code='global.lbl.systemNotiYn' />", width:70
                ,attributes:{"class":"ac"}
                ,editor:function(container, options) {
                    $('<input required name="systemNotiYn" data-bind="value:' + options.field + '"/>')
                    .appendTo(container)
                    .kendoExtDropDownList({
                        autoBind:true
                        ,dataSource:['Y','N']
                        ,index:0
                    });
                    $('<span class="k-invalid-msg" data-for="resourceTp"></span>').appendTo(container);
                }
            }
            ,{field:"emailNotiYn", title:"<spring:message code='global.lbl.emailNotiYn' />", width:70
                ,attributes:{"class":"ac"}
                ,editor:function(container, options) {
                    $('<input required name="emailNotiYn" data-bind="value:' + options.field + '"/>')
                    .appendTo(container)
                    .kendoExtDropDownList({
                        autoBind:true
                        ,dataSource:['Y','N']
                        ,index:0
                    });
                    $('<span class="k-invalid-msg" data-for="resourceTp"></span>').appendTo(container);
                }
            }
            ,{field:"hpNotiYn", title:"<spring:message code='global.lbl.hpNotiYn' />", width:70
                ,attributes:{"class":"ac"}
                ,editor:function(container, options) {
                    $('<input required name="hpNotiYn" data-bind="value:' + options.field + '"/>')
                    .appendTo(container)
                    .kendoExtDropDownList({
                        autoBind:true
                        ,dataSource:['Y','N']
                        ,index:0
                    });
                    $('<span class="k-invalid-msg" data-for="resourceTp"></span>').appendTo(container);
                }
            }
        ]
        ,change:function(e) {
            if(e.sender.dataItem(e.sender.select()) != null) {
//                var selectedVal = this.dataItem(this.select());

//                gv_notificationReceiverGridModel_currUid = selectedVal.uid;

//                $('#seq').val(selectedVal.seq);
//                $('#emailNm').val(selectedVal.emailNm);
//                $('#hpNo').val(selectedVal.hpNo);
//                $('#delYn').data("kendoExtDropDownList").value(selectedVal.delYn);
//                $('#deployNotiYn').data("kendoExtDropDownList").value(selectedVal.deployNotiYn);
//                $('#systemNotiYn').data("kendoExtDropDownList").value(selectedVal.systemNotiYn);
//                $('#emailNotiYn').data("kendoExtDropDownList").value(selectedVal.emailNotiYn);
//                $('#hpNotiYn').data("kendoExtDropDownList").value(selectedVal.hpNotiYn);

            } else {

            }


        }
        ,dataBinding:function(e) {

        }
        ,dataBound:function(e) {
            var grid = e.sender;
            var row = grid.tbody.find("tr:eq(" + indexOfNotiReceiverGrid +")");
            if(row.length > 0) {
                grid.select(row);
            } else {

            }

        }
    });

    var notiReceiverGrid = $('#notiReceiverGrid').data('kendoExtGrid');

    $(notiReceiverGrid.tbody).on("click", "td", function (e) {
        var row = $(this).closest("tr");
        var rowIdx = $("tr", notiReceiverGrid.tbody).index(row);
        var colIdx = $("td", row).index(this);

        indexOfNotiReceiverGrid = rowIdx;
    });




    //버튼 - 조회
    $("#btnSearchSimulationServer").kendoButton({
        click:function(e) {
            $('#simulationServerGrid').data('kendoExtGrid').dataSource.read();
        }
    });

    $("#btnSaveSimulationServer").kendoButton({
        click:function(e) {

            var grid = $("#simulationServerGrid").data("kendoExtGrid");

            // 저장하시겠습니까?
            if(!confirm("<spring:message code='global.lbl.save' var='globalLblUpdate' /><spring:message code='global.info.cnfrmMsg' arguments='${globalLblUpdate}' />")){
                return;
            }

            var saveData = grid.getCUDData("insertList", "updateList", "deleteList");
            if (grid.cudDataLength == 0) {
                //변경된 정보가 없습니다.
                dms.notification.info("<spring:message code='global.info.required.change'/>");
                return;
            }

            if (grid.gridValidation()) {
                $.ajax({
                    url:"<c:url value='/dply/cmm/mng/multiSimulationServer.do' />"
                    ,data:JSON.stringify(saveData)
                    ,type:'POST'
                    ,dataType:'json'
                    ,contentType:'application/json'
                    ,error:function(jqXHR,status,error) {

                        dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                    }
                    ,success:function(jqXHR, textStatus) {

                        grid.dataSource._destroyed = [];
//                         grid.dataSource.page(1);
                        grid.dataSource.read();


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

    $("#btnAddSimulationServer").kendoButton({
        click:function(e) {
            $('#simulationServerGrid').data('kendoExtGrid').dataSource.insert(0, {

            });
        }
    });

    //
    $("#btnDelSimulationServer").kendoButton({
        click:function(e) {
            var grid = $("#simulationServerGrid").data("kendoExtGrid");
            var rows = grid.select();

            rows.each(function(index, row) {
                grid.removeRow(row);
            });
        }
    });

    $("#btnCancelSimulationServer").kendoButton({
        click:function(e) {
            $('#simulationServerGrid').data('kendoExtGrid').cancelChanges();
        }
    });

    //그리드 설정
    $("#simulationServerGrid").kendoExtGrid({
        dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/dply/cmm/mng/selectSimulationServer.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};

                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

//                         params["sSeq"] = $("#sSeq").val();
//                         params["sEmailNm"] = $("#sEmailNm").val();
//                         params["sHpNo"] = $("#sHpNo").val();

                        return kendo.stringify(params);

                    } else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,schema:{
                model:{
                    id:"dlrCd"
                    ,fields:{
                        dlrCd        :{type:"string", validation:{required:true}}
                        ,dlrNm       :{type:"string", validation:{required:true}}
                        ,dmsIpNm     :{type:"string", validation:{required:true}}
                        ,dmsPortNm   :{type:"string"}
                        ,dmsTestUrlNm:{type:"string"}
                        ,telNo       :{type:"string"}
                        ,faxNo       :{type:"string"}
                        ,regUsrId    :{type:"string"}
                        ,regDt       :{type:"date"}
                        ,updtUsrId   :{type:"string"}
                        ,updtDt      :{type:"date"}
                    }
                }
            }
            ,requestEnd:function(e) {
                $("#notiReceiverGrid").data("kendoExtGrid").dataSource.data([]);


            }
        }
        ,height:450
        ,autoBind:false
        ,selectable:"row"
        ,pageable:false
        ,multiSelectWithCheckbox:true
        ,editableOnlyNew:true
        ,editableOnlyNewExcludeColumns:["dlrNm","telNo","faxNo","dmsIpNm","dmsPortNm","dmsTestUrlNm"]
        ,columns:[
            {field:"dlrCd", title:"<spring:message code='global.lbl.dlrCd' />", width:60, sortable:false
                ,attributes:{"class":"ac"}
            }
            ,{field:"dlrNm", title:"<spring:message code='global.lbl.dlrNm' />", width:80
            }
            ,{field:"dmsIpNm", title:"<spring:message code='global.lbl.dmsIpNm' />", width:80
                ,attributes:{"class":"ac"}
            }
            ,{field:"dmsPortNm", title:"<spring:message code='global.lbl.dmsPortNm' />", width:60
                ,attributes:{"class":"ac"}
            }
            ,{field:"dmsTestUrlNm", title:"<spring:message code='global.lbl.dmsTestUrlNm' />", width:120
                ,attributes:{"class":"ac"}
            }
            ,{field:"telNo", title:"<spring:message code='global.lbl.telNo' />", width:70, sortable:false
                ,attributes:{"class":"ac"}
            }
            ,{field:"faxNo", title:"<spring:message code='global.lbl.faxNo' />", width:70, sortable:false
                ,attributes:{"class":"ac"}
            }

        ]
        ,change:function(e) {
            if(e.sender.dataItem(e.sender.select()) != null) {
//                var selectedVal = this.dataItem(this.select());

//                gv_notificationReceiverGridModel_currUid = selectedVal.uid;

//                $('#seq').val(selectedVal.seq);
//                $('#emailNm').val(selectedVal.emailNm);
//                $('#hpNo').val(selectedVal.hpNo);
//                $('#delYn').data("kendoExtDropDownList").value(selectedVal.delYn);
//                $('#deployNotiYn').data("kendoExtDropDownList").value(selectedVal.deployNotiYn);
//                $('#systemNotiYn').data("kendoExtDropDownList").value(selectedVal.systemNotiYn);
//                $('#emailNotiYn').data("kendoExtDropDownList").value(selectedVal.emailNotiYn);
//                $('#hpNotiYn').data("kendoExtDropDownList").value(selectedVal.hpNotiYn);

            } else {

            }


        }
        ,dataBinding:function(e) {

        }
        ,dataBound:function(e) {
            var grid = e.sender;
            var row = grid.tbody.find("tr:eq(" + indexOfSimulationServerGrid +")");
            if(row.length > 0) {
                grid.select(row);
            } else {

            }

        }
    });

    var simulationServerGrid = $('#simulationServerGrid').data('kendoExtGrid');

    $(simulationServerGrid.tbody).on("click", "td", function (e) {
        var row = $(this).closest("tr");
        var rowIdx = $("tr", simulationServerGrid.tbody).index(row);
        var colIdx = $("td", row).index(this);

        indexOfSimulationServerGrid = rowIdx;
    });



    /* App정보 등록 */

    //버튼 - 조회
    $("#btnSearchAppInfo").kendoButton({
        click : function(e) {
            $('#appInfoGrid').data('kendoExtGrid').dataSource.read();
        }
    });

    $("#btnSaveAppInfo").kendoButton({
        click : function(e) {

            var grid = $("#appInfoGrid").data("kendoExtGrid");

            // 저장하시겠습니까?
            if(!confirm("<spring:message code='global.lbl.save' var='globalLblUpdate' /><spring:message code='global.info.cnfrmMsg' arguments='${globalLblUpdate}' />")){
                return;
            }

            var saveData = grid.getCUDData("insertList", "updateList", "deleteList");
            if (grid.cudDataLength == 0) {
                //변경된 정보가 없습니다.
                dms.notification.info("<spring:message code='global.info.required.change'/>");
                return;
            }

            if (grid.gridValidation()) {
                $.ajax({
                    url : "<c:url value='/dply/cmm/mng/multiAppInfo.do' />"  //
                    ,data : JSON.stringify(saveData)
                    ,type : 'POST'
                    ,dataType : 'json'
                    ,contentType : 'application/json'
                    ,error : function(jqXHR,status,error) {

                        dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                    }
                    ,success : function(jqXHR, textStatus) {

                        grid.dataSource._destroyed = [];
//                         grid.dataSource.page(1);
                        grid.dataSource.read();


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

    $("#btnAddAppInfo").kendoButton({
        click : function(e) {
            $('#appInfoGrid').data('kendoExtGrid').dataSource.insert(0, {

            });
        }
    });

    //
    $("#btnDelAppInfo").kendoButton({
        click : function(e) {
            var grid = $("#appInfoGrid").data("kendoExtGrid");
            var rows = grid.select();

            rows.each(function(index, row) {
                grid.removeRow(row);
            });
        }
    });

    $("#btnCancelAppInfo").kendoButton({
        click : function(e) {
            $('#appInfoGrid').data('kendoExtGrid').cancelChanges();
        }
    });

    //그리드 설정
    $("#appInfoGrid").kendoExtGrid({
        dataSource : {
             transport : {
                read : {
                    url : "<c:url value='/dply/cmm/mng/selectAppInfo.do' />" //
                }
                ,parameterMap : function(options, operation) {
                    if (operation === "read") {

                        var params = {};


                        return kendo.stringify(params);

                    } else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,schema : {
                model : {
                    id : "symbolicNm"
                    ,fields : {
                    	symbolicNm   : {type : 'string', validation : {required : true}}
                        ,bundleNm    : {type : 'string', editable : true}
                        ,bundleVerNo : {type : 'string', editable : true}
                        ,regUsrId    : {type : "string"}
                        ,regDt       : {type : "date"}
                        ,updtUsrId   : {type : "string"}
                        ,updtDt      : {type : "date"}

                    }
                }
            }
            ,requestEnd : function(e) {

            }
        }
        ,height : 450
        ,autoBind : false
        ,selectable:"row"
        ,pageable : false
        ,multiSelectWithCheckbox : true
        ,editableOnlyNew : true
        ,editableOnlyNewExcludeColumns : ["symbolicNm","bundleNm","bundleVerNo"]
        ,columns : [
            {field : "symbolicNm", title : "<spring:message code='global.lbl.symbolicNm' />", width :400
            }
            ,{field : "bundleNm", title : "<spring:message code='global.lbl.bundleNm' />", width : 400
            }
            ,{field : "bundleVerNo", title : "<spring:message code='global.lbl.bundleVerNo' />", width : 150
            	,attributes : {"class" : "ac"}
            }
            ,{title : ""}
        ]
        ,change : function(e) {
            if(e.sender.dataItem(e.sender.select()) != null) {
                var selectedVal = this.dataItem(this.select());

            } else {

            }


        }
        ,dataBinding : function(e) {

        }
        ,dataBound : function(e) {
            var grid = e.sender;
            var row = grid.tbody.find("tr:eq(" + indexOfAppInfoGrid +")");
            if(row.length > 0) {
                grid.select(row);
            } else {

            }

        }
    });

    var appInfoGrid = $('#appInfoGrid').data('kendoExtGrid');

    $(appInfoGrid.tbody).on("click", "td", function (e) {
        var row = $(this).closest("tr");
        var rowIdx = $("tr", appInfoGrid.tbody).index(row);
        var colIdx = $("td", row).index(this);

        indexOfAppInfoGrid = rowIdx;
    });

/* App정보 등록  끝*/

    function reloadSharedMemory() {
        var params = {};

        params["mesgCd"]      = '10003';       // Shared Memory Info Reloading Request
        params["mesgGrpCd"]   = 'I';           // SyncCommandSndr
        params["reload"]      = 'ALL';         //

//         params["dlrCd"] = winOptions.dlrCd;

        $.ajax({
            url:"<c:url value='/dply/cmm/sync/multiSyncCommand.do' />",
            data:JSON.stringify(params),
            type:'POST',
            dataType:'json',
            contentType:'application/json',
            error:function(jqXHR, status, error) {
               alert(error);
               dms.notification.error(jqXHR.responseJSON.errors);

            },
            success:function(jqXHR, textStatus) {
                postReloadSharedMemory(jqXHR, params);
            }
        });

    }


    function postReloadSharedMemory(jqXHR, params) {
        var objXML = $.parseXML(jqXHR);
        var objJson = $.xml2json(objXML);

        var objTarget = $(objXML).find('result_list');
        objJson.total = objTarget.length;

        console.log(JSON.stringify(objJson));
//         alert(JSON.stringify(objJson));
//         alert(JSON.stringify(objJson.result));

        if(objJson.result == "OK") {
            //정상적으로 반영 되었습니다.
            dms.notification.success("<spring:message code='global.info.success'/>");

        } else {
            dms.notification.error(objJson.result_msg);
        }

/*
        if(objJson.total == 1) {
            var list = [];
            list[0] = objJson.result_list;
            $('#tableGrid').data("kendoExtGrid").dataSource.data(list);
        } else {
            $('#tableGrid').data("kendoExtGrid").dataSource.data(objJson.result_list);
        }
*/
    }






});





</script>








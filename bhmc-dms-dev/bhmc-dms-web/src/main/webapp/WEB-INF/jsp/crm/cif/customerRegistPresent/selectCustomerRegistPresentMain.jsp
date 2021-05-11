<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script type="text/javascript" src="<c:url value='/resources/js/dms/sha256.js' />"></script>
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.crm-1.0.js' />"></script>

        <div id="resizableContainer">  <!--  resizableContainer Div -->
            <!-- 고객등록 현황(개인) -->
            <section class="group">
                <div class="header_area">
                    <h1 class="title_basic"><spring:message code="crm.menu.custInfo" /></h1><!-- 고객등록 현황 -->
                    <div class="btn_right">
                    <dms:access viewId="VIEW-D-12917" hasPermission="${dms:getPermissionMask('READ')}">
                        <button class="btn_m btn_assignment" id="btnMngScReAssign"><spring:message code='crm.btn.mngScReAssign' /></button><!-- 재배정 -->
                    </dms:access>
                    <dms:access viewId="VIEW-D-11043" hasPermission="${dms:getPermissionMask('READ')}">
                        <button class="btn_m btn_link" id="btnTagLink"><spring:message code='global.btn.tagMng' /></button><!-- 태그관리 -->
                    </dms:access>
                    <dms:access viewId="VIEW-D-11044" hasPermission="${dms:getPermissionMask('READ')}">
                        <button class="btn_m btn_modify" id="btnModify"><spring:message code='global.btn.update' /></button><!-- 수정 -->
                    </dms:access>
                    <dms:access viewId="VIEW-D-11045" hasPermission="${dms:getPermissionMask('READ')}">
                        <button class="btn_m btn_search" id="btnCustSearch"><spring:message code='global.btn.search' /></button><!-- 조회 -->
                    </dms:access>
                    <dms:access viewId="VIEW-D-11046" hasPermission="${dms:getPermissionMask('READ')}">
                        <button class="btn_m btn_excel" id="btnCtlExcelExport"><spring:message code='global.btn.excelExport' /><!-- 엑셀다운로드 Excel下?--></button>
                    </dms:access>
                    </div>
                </div>
                <div class="table_form" role="search" data-btnid="btnCustSearch">
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
                            <col style="width:17%;">
                        </colgroup>
                        <tbody>
                            <tr>
                                <th scope="row"><spring:message code='global.lbl.custNm' /></th><!-- 고객명 -->
                                <td>
                                    <input type="text" id="sCustNm" name="sCustNm" class="form_input" data-json-obj="true">
                                </td>
                                <th scope="row"><spring:message code='global.lbl.custTp' /></th><!-- 고객유형 개인/법인 -->
                                <td>
                                    <input id="sCustTp" name="sCustTp" class="form_comboBox" data-json-obj="true">
                                </td>
                                <th scope="row"><spring:message code="global.lbl.custCd" /></th><!-- 잠재/보유 -->
                                <td>
                                    <input type="text" id="sCustCd" name="sCustCd" class="form_comboBox" data-json-obj="true">
                                </td>
                                <th scope="row"><spring:message code='crm.lbl.scId' /></th><!-- 판매고문 -->
                                <td>
                                    <input id="sMngScId" name="sMngScId" class="form_comboBox" data-json-obj="true">
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="global.lbl.custNo" /></th> <!-- 고객번호 -->
                                <td>
                                    <input id="sCustNo" name="sCustNo" type="text" class="form_input" data-json-obj="true" />
                                </td>
                                <th scope="row"><spring:message code="global.lbl.ssnCrnNo" /></th> <!-- 증거번호  -->
                                <td>
                                    <input id="sSsnCrnNo" name="sSsnCrnNo" type="text" value="" class="form_input"  pattern="[0-9A-Z]" maxlength="20" data-json-obj="true" />
                                </td>
                                <th scope="row"><spring:message code="global.lbl.vinNum" /></th> <!-- VIN  -->
                                <td>
                                    <input id="sVinNo" name="sVinNo" type="text" value="" class="form_input" data-json-obj="true" />
                                </td>
                                <th scope="row"><spring:message code="global.lbl.carNo" /></th> <!-- 차량번호  -->
                                <td>
                                    <input id="sCarRegNo" name="sCarRegNo" type="text" value="" class="form_input" data-json-obj="true" />
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code='global.lbl.hpNo' /></th><!-- 이동전화 -->
                                <td>
                                    <input type="text" id="sHpNo" name="sHpNo" value="" class="form_input numberic" data-json-obj="true">
                                </td>
                                <th scope="row"><spring:message code="sal.lbl.saleDt" /></th><!-- 판매일자 -->
                                <td>
                                    <div class="form_float">
                                    <div class="date_left">
                                        <input id="sSaleDtFrom" name="sSaleDtFrom" class="form_datepicker" data-json-obj="true"  data-type="maskDate"/>
                                        <span class="txt_from">~</span>
                                    </div>
                                    <div class="date_right">
                                        <input id="sSaleDtTo" name="sSaleDtTo" class="form_datepicker" data-json-obj="true"  data-type="maskDate"/>
                                    </div>
                                    </div>
                                </td>
                                <th scope="row"><spring:message code="crm.lbl.latestRoDt" /></th><!-- 마지막정비일자 -->
                                <td>
                                    <div class="form_float">
                                    <div class="date_left">
                                        <input id="sRoDtFrom" name="sRoDtFrom" class="form_datepicker" data-json-obj="true"  data-type="maskDate"/>
                                        <span class="txt_from">~</span>
                                    </div>
                                    <div class="date_right">
                                        <input id="sRoDtTo" name="sRoDtTo" class="form_datepicker" data-json-obj="true"  data-type="maskDate"/>
                                    </div>
                                    </div>
                                </td>
                                <th scope="row"><spring:message code="crm.lbl.custCollSrc" /></th><!-- 고객 수집 경로 -->
                                <td>
                                    <input id="sCustCollSrcCd" name="sCustCollSrcCd" class="form_comboBox" data-json-obj="true">
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="global.lbl.tag" /></th><!-- 태그 -->
                                <td>
                                    <select id="sCustTags" name="sCustTags" multiple="multiple" ></select>
                                </td>
                                <th scope="row"><spring:message code="global.lbl.regDt" /></th><!-- 태그 -->
                                <td>
                                    <div class="form_float">
                                    <div class="date_left">
                                        <input id="sRegDtFrom" name="sRegDtFrom" class="form_datepicker" data-json-obj="true"  data-type="maskDate"/>
                                        <span class="txt_from">~</span>
                                    </div>
                                    <div class="date_right">
                                        <input id="sRegDtTo" name="sRegDtTo" value="" class="form_datepicker" data-json-obj="true"  data-type="maskDate"/>
                                    </div>
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="table_grid mt10">
                    <div id="customerGrid" class="resizable_grid"></div>
                </div>

            </section>
            <!-- //고객등록 현황(법인) -->
        </div>   <!--  resizableContainer Div -->

<!--  ************************** assignDiv **************************** -->
        <section id="assignDiv" class="pop_wrap"> <!-- assignDiv Start -->
            <div class="header_area">
                <div class="btn_right">
                    <button id="btnAssign" class="btn_s"><spring:message code='global.btn.assign' /><!-- 배정 --></button>
                </div>
            </div>
            <div>
                <div class="table_form form_width_100per">
                    <table>
                        <caption></caption>
                        <colgroup>
                            <col style="width:10%;">
                            <col style="width:15%;">
                        </colgroup>
                        <tbody>
                            <tr>
                                <th scope="row" class="al"><spring:message code='global.lbl.handler' /><!-- 조작인 --></th>
                                <td>
                                    ${loginUsrNm} (${usrId})
                                </td>
                            </tr>
                            <tr>
                                <th scope="row" class="al"><spring:message code='crm.lbl.scId' /><!-- 판매고문 --></th>
                                <td>
                                    <input id="assignUsers" name="assignUsers" class="form_comboBox" data-json-obj="true">
                                </td>
                            </tr>
                            <tr>
                                <th scope="row" class="al"><spring:message code="global.lbl.usrPw" /></th> <!-- 비밀번호 -->
                                <td>
                                    <input id="usrPw" name="usrPw" type="password" class="form_input"  data-json-obj="true" />
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </section>
<!--  ************************** assignDiv **************************** -->

<!-- script start  -->
<script type="text/javascript" charset="UTF-8">

    var toDt            = new Date();

    var custCdList = [];
    var custCdMap = [];
    var custTpList = [];
    var custTpMap = [];
    var custCollSrcCdList = [];
    var custCollSrcCdMap = [];
    var custTags = [];
    var mathDocTpMap = [];
    var mngScIdCtrl = "${mngScIdCtrl}";
    var salesOpptPwYn          = "${salesOpptPwYn}";
    var usrId = "${usrId}";
    var mngScUserList = [];
    var leadStatCdMap = [];
    var chinaZodiacSignCdMap = [];
    var carlineCdMap = [];

    var ynCdList = [];
    var ynCdMap = [];
    ynCdList.push({"cmmCd":"Y" , "cmmCdNm":"<spring:message code='global.lbl.yes' />"});
    ynCdList.push({"cmmCd":"N" , "cmmCdNm":"<spring:message code='global.lbl.n' />"});
    ynCdMap["Y"] = "<spring:message code='global.lbl.yes' />";
    ynCdMap["N"] = "<spring:message code='global.lbl.n' />";

    <c:forEach var="obj" items="${carlineCdList}">
    carlineCdMap["${obj.carlineCd}"] = "${obj.carlineNm}";
    </c:forEach>

    <c:forEach var="obj" items="${chinaZodiacSignCdDS}" >
    chinaZodiacSignCdMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
    </c:forEach>

    <c:forEach var="obj" items="${custCollSrcCdList}" >
    custCollSrcCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    custCollSrcCdMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
    </c:forEach>

    <c:forEach var="obj" items="${leadStatCdList}" >
    leadStatCdMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
    </c:forEach>

    <c:forEach var="obj" items="${custCdList}" >
    custCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    custCdMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
    </c:forEach>

    <c:forEach var="obj" items="${mngScUserList}" >
    mngScUserList.push({"usrId":"${obj.usrId}", "usrNm":"${obj.usrNm}"});
    </c:forEach>

    <c:forEach var="obj" items="${custTpList}" >
    custTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    custTpMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
    </c:forEach>

    <c:forEach var="obj" items="${mathDocTpList}" >
    mathDocTpMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
    </c:forEach>

    <c:forEach var="obj" items="${custTags}">
    custTags.push({"grpSeq":"${obj.grpSeq}", "grpNm":"${obj.grpNm}"});
    </c:forEach>

    var defaultTagDatasourceSetting = function(e){
        tagDS = [];
        var selectedTags = $("#sCustTags").data("kendoMultiSelect").value();

        if(selectedTags.length == 0){
            return;
        }

        $.each(custTags, function(index, data){
            if(selectedTags.indexOf(data.grpSeq) > -1){
                tagDS.push({"grpSeq":data.grpSeq,"grpTp":"002"});
            }
        });
    };

    /**
    * hyperlink in grid event
    */
    $(document).on("click", ".linkCust", function(e){
         var grid = $("#customerGrid").data("kendoExtGrid"),
         row = $(e.target).closest("tr");
         var dataItem = grid.dataItem(row);
         window.parent._createOrReloadTabMenu("<spring:message code='crm.menu.custInfo' />", "<c:url value='/crm/cif/customerInfo/selectCustomerInfoMain.do' />?custNo="+dataItem.custNo, "VIEW-D-10271"); // CUST NO
    });

    // 그리드 더블클릭 이벤트 ( 그리드 아이디 변경 )
    $("#customerGrid").on("dblclick", "tr.k-state-selected", function (e) {
         var grid = $("#customerGrid").data("kendoExtGrid")
             , dataItem = grid.dataItem(grid.select())
         ;
         window.parent._createOrReloadTabMenu("<spring:message code='crm.menu.custInfo' />", "<c:url value='/crm/cif/customerInfo/selectCustomerInfoMain.do' />?custNo="+dataItem.custNo, "VIEW-D-10271"); // CUST NO
    });


    function gridCommonParams() {
        // 그리드 상세 조회 및 엑셀export 수량 확인을 위한 공통 param
        var params = {};
        //---liuxueying add start
        var sRegDtFrom = $("#sRegDtFrom").data("kendoExtMaskedDatePicker").value();
        var sRegDtTo = $("#sRegDtTo").data("kendoExtMaskedDatePicker").value();
        //---liuxueying add end
        
        var sSaleDtFrom = $("#sSaleDtFrom").data("kendoExtMaskedDatePicker").value();
        var sSaleDtTo = $("#sSaleDtTo").data("kendoExtMaskedDatePicker").value();

        var sRoDtFrom = $("#sRoDtFrom").data("kendoExtMaskedDatePicker").value();
        var sRoDtTo = $("#sRoDtTo").data("kendoExtMaskedDatePicker").value();

        if ( (dms.string.isNotEmpty(sSaleDtFrom) && dms.string.isEmpty(sSaleDtTo)) ||
                (dms.string.isEmpty(sSaleDtFrom) && dms.string.isNotEmpty(sSaleDtTo))
        ){
            dms.notification.warning("<spring:message code='sal.lbl.saleDt' var='returnMsg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${returnMsg}' />");
            return false;
        }
        if ( (dms.string.isNotEmpty(sRoDtFrom) && dms.string.isEmpty(sRoDtTo)) ||
                (dms.string.isEmpty(sRoDtFrom) && dms.string.isNotEmpty(sRoDtTo))
        ){
            dms.notification.warning("<spring:message code='crm.lbl.latestRoDt' var='returnMsg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${returnMsg}' />");
            return false;
        }

        params["sMngScId"] = $("#sMngScId").data("kendoExtDropDownList").value();
        params["sCustNm"] = $("#sCustNm").val();
        params["sCustCd"] = $("#sCustCd").data("kendoExtDropDownList").value();
        params["sHpNo"] = $("#sHpNo").val();
        params["sCustNo"] = $("#sCustNo").val();
        params["sSsnCrnNo"] = $("#sSsnCrnNo").val();
        params["tagDS"] = $("#sCustTags").data("kendoMultiSelect").value();
        params["sCustCollSrcCd"] = $("#sCustCollSrcCd").data("kendoExtDropDownList").value();
        if ( dms.string.isNotEmpty($("#sCustTags").data("kendoMultiSelect").value())){
            params["sCommand"] = "TAGSEARCH";
        }

        params["sCustTp"] = $("#sCustTp").data("kendoExtDropDownList").value();
        params["sVinNo"] = $("#sVinNo").val();
        params["sCarRegNo"] = $("#sCarRegNo").val();

        params["sSaleDtFrom"] = sSaleDtFrom;
        params["sSaleDtTo"] = sSaleDtTo;
        params["sRoDtFrom"] = sRoDtFrom;
        params["sRoDtTo"] = sRoDtTo;

        //---liuxueying add start
        params["sRegDtFrom"] = sRegDtFrom;
        params["sRegDtTo"] = sRegDtTo;
        //---liuxueying add end
        return params;

    };



$(document).ready(function() {
    // 숫자
    var onlyNum = new RegExp("[^0-9]","i");
    $(".numberic").keyup(function(e)
    {
        var content = $(this).val();

        if(content.match(onlyNum)){
            console.log($(this).val());
            $(this).val('');
        }
    });
    $(".numberic").focusout(function(){
        $(this).val($.trim($(this).val()));
        var content = $(this).val();
        if(content.match(onlyNum)){
            $(this).val('');
        }
    });

    $("#sCustTp").kendoExtDropDownList({
       dataTextField:"cmmCdNm"
       , dataValueField:"cmmCd"
       , dataSource:custTpList
       , optionLabel:" "
    });

    $("#sCustCd").kendoExtDropDownList({
       dataTextField:"cmmCdNm"
       , dataValueField:"cmmCd"
       , dataSource:custCdList
       , optionLabel:" "
    });

    $("#sMngScId").kendoExtDropDownList({
       dataTextField:"usrNm"
       ,dataValueField:"usrId"
       ,dataSource:mngScUserList
       , optionLabel:" "
    });

    $("#sCustCollSrcCd").kendoExtDropDownList({
       dataTextField:"cmmCdNm"
       ,dataValueField:"cmmCd"
       ,dataSource:custCollSrcCdList
       ,optionLabel:" "
    });

    if (mngScIdCtrl == "N") {
        $("#sMngScId").data("kendoExtDropDownList").value("${usrId}");
        $("#sMngScId").data("kendoExtDropDownList").enable(false);
    }

    // 태그
    $("#sCustTags").kendoMultiSelect({
        dataSource:custTags,
        valuePrimitive:true,
        placeholder:"",
        dataTextField:"grpNm",
        dataValueField:"grpSeq",
        dataBound:defaultTagDatasourceSetting,
        change:defaultTagDatasourceSetting
    });

    // bhmc여부(검색).   sBhmcYn
    $("#sBhmcYn").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        , optionLabel:" "
        , dataSource:ynCdList
        , index:0
    });

    // 배정 담당자
    $("#assignUsers").kendoExtDropDownList({
        dataSource: mngScUserList
        , optionLabel:" "
        , dataTextField: "usrNm"
        , dataValueField: "usrId"
    });

    // 판매일 From - To
    $("#sSaleDtFrom").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        //,change:fnChkDateValue
    });
    $("#sSaleDtTo").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        //,change:fnChkDateValue
    });

    // 마지막정비일자 From - To
    $("#sRoDtFrom").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });
    $("#sRoDtTo").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });

    //liuxueying add start
    $("#sRegDtFrom").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });
    $("#sRegDtTo").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });
    //liuxueying add end

    // 재배정 버튼.
    $("#btnMngScReAssign").kendoButton({
        click:function(e){

            var saveList      = [],
            grid          = $("#customerGrid").data("kendoExtGrid"),
            rows          = grid.tbody.find("tr"),
            chkRow;

            rows.each(function(index, row) {
                var gridData = grid.dataSource.at(index);
                var data={};

                chkRow = $(".grid-checkbox-item[data-uid=" + $(this).attr("data-uid") + "]").is(":checked");

                if(chkRow === true){
//                 if (gridData.custCd == "02" ) {   // 보유 고객만 판매고문 변경.
                    data.dlrCd = gridData.dlrCd;
                    data.custNo = gridData.custNo;
                    //data.mngScId = assignUser;
                    saveList.push(data);
//                 }        // 보유 고객만 판매고문 변경.
                }
            });

            if(saveList.length == 0 ){
                // 배정목록 / 을(를) 선택해주세요.
                dms.notification.warning("<spring:message code='global.lbl.custList' var='arguMsg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${arguMsg}' />");
                return false;
            }

            var assignDiv = $("#assignDiv").data("kendoWindow");
            $("#usrPw").val("");
            if (salesOpptPwYn == "N"){
                $("#usrPw").attr("readonly", true);
                $("#usrPw").addClass("form_readonly");
            }
            assignDiv.center();
            assignDiv.open();

        }
        //,enable:false
    });
/*     if (mngScIdCtrl == "Y") {
        $("#btnMngScReAssign").data("kendoButton").enable(true);
    } */

    $("#assignDiv").kendoWindow({
        animation:false
        ,draggable: true
        ,modal: false
        ,resizable: false
        ,visible: false
        ,title: "<spring:message code='crm.lbl.mngScAssign' />"      // 판매고문 배정
        ,width: "300px"
        ,height: "125px"
    }).data("kendoWindow");

    // 배정저장
    $("#btnAssign").kendoButton({
        click: function(e){

            var usrPw = $("#usrPw").val();

               // 비밀번호 체크 시작
               console.log("salesOpptPwYn : " + salesOpptPwYn);
            if (salesOpptPwYn == "Y") {
                if (dms.string.isEmpty(usrPw)) {
                    dms.notification.info("<spring:message code='crm.info.emptyPw' />");
                    return false;
                }

                var fnPasschk = fn_passwdChk(usrPw);
               if (fnPasschk == false){
                   dms.notification.warning("<spring:message code='crm.err.invalid.pw'/>");
                   return false;
               }

            }
           // 비밀번호 체크 끝

            var saveList      = [],
                grid          = $("#customerGrid").data("kendoExtGrid"),
                rows          = grid.tbody.find("tr"),
                assignUser    = $("#assignUsers").data("kendoExtDropDownList").value(),
                chkRow,
                saveData;

            console.log("assignUser : " + assignUser);

            if ( dms.string.isEmpty(assignUser)){
                // 배정담당자 / 을(를) 선택해주세요.
                dms.notification.warning("<spring:message code='crm.lbl.scId' var='arguMsg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${arguMsg}' />");
                return false;
            }

            rows.each(function(index, row) {
                var gridData = grid.dataSource.at(index);
                var data={};

                chkRow = $(".grid-checkbox-item[data-uid=" + $(this).attr("data-uid") + "]").is(":checked");

                if(chkRow === true){
//                     if (gridData.custCd == "02" ) {   // 보유 고객만 판매고문 변경.
                        data.dlrCd = gridData.dlrCd;
                        data.custNo = gridData.custNo;
                        data.mngScId = assignUser;

                        saveList.push(data);
                }
            });

            if(saveList.length == 0 ){
                // 배정목록 / 을(를) 선택해주세요.
                dms.notification.warning("<spring:message code='global.lbl.custList' var='arguMsg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${arguMsg}' />");
                return false;
            }

            saveData ={
                "updateList":saveList
            };

//             console.log("Re Assign Customer!!");
//             console.log(saveData);

            $.ajax({
                //url:"<c:url value='/crm/ass/assign/updateSalesOpptAssign.do' />"
                url:"<c:url value='/crm/cif/customerInfo/updateCustomerMngScAssign.do' />"
                ,data:JSON.stringify(saveData)
                ,type:'POST'
                ,dataType:'json'
                ,contentType:'application/json'
                ,error:function(jqXHR, status, error) {
                    console.log(jqXHR);
                    dms.notification.error(jqXHR.responseJSON.errors);
                }
                ,success:function(jqXHR, textStatus) {

                    grid.dataSource._destroyed = [];
                    grid.dataSource.page(1);

                    //정상적으로 반영 되었습니다.
                    dms.notification.success("<spring:message code='global.info.success'/>");

                    var assignDiv = $("#assignDiv").data("kendoWindow");
                    assignDiv.close();

                    $("#btnCustSearch").click();
                }
            });
        }
    });

    // 검색 버튼.
    $("#btnCustSearch").kendoButton({
        click:function(e){

            var sSaleDtFrom = $("#sSaleDtFrom").data("kendoExtMaskedDatePicker").value();
            var sSaleDtTo = $("#sSaleDtTo").data("kendoExtMaskedDatePicker").value();

            var sRoDtFrom = $("#sRoDtFrom").data("kendoExtMaskedDatePicker").value();
            var sRoDtTo = $("#sRoDtTo").data("kendoExtMaskedDatePicker").value();

            if ( dms.string.isEmpty(sSaleDtFrom) ) {
                if ( dms.string.isNotEmpty(sSaleDtTo) ) {
                    dms.notification.warning("<spring:message code='sal.lbl.saleDt' var='returnMsg' /><spring:message code='global.info.emptyParamInfo' arguments='${returnMsg}' />");
                    $("#sSaleDtFrom").focus();
                    return false;
                }
            }
            if ( dms.string.isEmpty(sSaleDtTo) ) {
                if (dms.string.isNotEmpty(sSaleDtFrom)) {
                    dms.notification.warning("<spring:message code='sal.lbl.saleDt' var='returnMsg' /><spring:message code='global.info.emptyParamInfo' arguments='${returnMsg}' />");
                    $("#sSaleDtTo").focus();
                    return false;
                }
            }

            if ( dms.string.isEmpty(sRoDtFrom)){
                if (dms.string.isNotEmpty(sRoDtTo)) {
                    dms.notification.warning("<spring:message code='crm.lbl.latestRoDt' var='returnMsg' /><spring:message code='global.info.emptyParamInfo' arguments='${returnMsg}' />");
                    $("#sRoDtFrom").focus();
                    return false;
                }
            }
            if ( dms.string.isEmpty(sRoDtTo)){
                if (dms.string.isNotEmpty(sRoDtFrom)) {
                    dms.notification.warning("<spring:message code='crm.lbl.latestRoDt' var='returnMsg' /><spring:message code='global.info.emptyParamInfo' arguments='${returnMsg}' />");
                    $("#sRoDtTo").focus();
                    return false;
                }
            }

            if(crmJs.isDateValidPeriod(sSaleDtFrom
                    ,sSaleDtTo,'<spring:message code="global.err.checkDateValue"/>')){
                $("#customerGrid").data("kendoExtGrid").dataSource.page(1);
            }else{
                $("#sSaleDtTo").data("kendoExtMaskedDatePicker").value(new Date(''));
                $("#sSaleDtTo").focus();
            }
        }
    });

    setKendoDate = function( dtValue){
        return kendo.toString(kendo.parseDate(dtValue),"<dms:configValue code='dateFormat' />");
    };
    //##################### 정비 코드 #####################

    //버튼 - 엑셀저장
    $("#btnCtlExcelExport").kendoButton({
        click:function(e) {

            var sSaleDtFrom = $("#sSaleDtFrom").data("kendoExtMaskedDatePicker").value();
            var sSaleDtTo = $("#sSaleDtTo").data("kendoExtMaskedDatePicker").value();

            var sRoDtFrom = $("#sRoDtFrom").data("kendoExtMaskedDatePicker").value();
            var sRoDtTo = $("#sRoDtTo").data("kendoExtMaskedDatePicker").value();

            if ( dms.string.isEmpty(sSaleDtFrom)){
                if (dms.string.isNotEmpty(sSaleDtTo)) {
                    dms.notification.warning("<spring:message code='sal.lbl.saleDt' var='returnMsg' /><spring:message code='global.info.emptyParamInfo' arguments='${returnMsg}' />");
                    $("#sSaleDtFrom").focus();
                    return false;
                }
            }
            if ( dms.string.isEmpty(sSaleDtTo)){
                if (dms.string.isNotEmpty(sSaleDtFrom)) {
                    dms.notification.warning("<spring:message code='sal.lbl.saleDt' var='returnMsg' /><spring:message code='global.info.emptyParamInfo' arguments='${returnMsg}' />");
                    $("#sSaleDtTo").focus();
                    return false;
                }
            }
            if ( dms.string.isEmpty(sRoDtFrom)){
                if (dms.string.isNotEmpty(sRoDtTo)) {
                    dms.notification.warning("<spring:message code='crm.lbl.latestRoDt' var='returnMsg' /><spring:message code='global.info.emptyParamInfo' arguments='${returnMsg}' />");
                    $("#sRoDtFrom").focus();
                    return false;
                }
            }
            if ( dms.string.isEmpty(sRoDtTo)){
                if (dms.string.isNotEmpty(sRoDtFrom)) {
                    dms.notification.warning("<spring:message code='crm.lbl.latestRoDt' var='returnMsg' /><spring:message code='global.info.emptyParamInfo' arguments='${returnMsg}' />");
                    $("#sRoDtTo").focus();
                    return false;
                }
            }

            if(crmJs.isDateValidPeriod(sSaleDtFrom
                    ,sSaleDtTo,'<spring:message code="global.err.checkDateValue"/>')){
            }else{
                $("#sSaleDtTo").data("kendoExtMaskedDatePicker").value(new Date(''));
                $("#sSaleDtTo").focus();
                return false;
            }

            var params = {};
            params = gridCommonParams();
//             console.log(params);

            // 고객 데이터 목록 엑셀Export 수량 데이터를 조회한다.
            $.ajax({
                url:"<c:url value='/crm/cif/customerRegistPresent/customerListSearchExcelExportCnt.do' />",
                data:JSON.stringify(params),
                type:'POST',
                dataType:'json',
                contentType:'application/json',
                error:function(jqXHR,status,error) {
                    dms.notification.error(jqXHR.responseJSON.errors);
                },
                success:function(resultCnt) {

                    <c:set value="10000" var="maxCnt" />;
                    var excelMaxExportCnt = <c:out value="${maxCnt}"/>;

                    if ( resultCnt > excelMaxExportCnt ) {
                        // {엑셀Export}는 { *** 个数} 를 초과할 수 없습니다.
                        dms.notification.warning("<spring:message code='crm.info.excelExport' var='returnMsg1' /><spring:message code='crm.info.maxExcelExportCnt' arguments='${maxCnt}' var='returnMsg2' /><spring:message code='crm.info.maxInfoChk' arguments='${returnMsg1}, ${returnMsg2}' />");
                        return;
                    };

                    var sysDateExcelNm = new Date();
                    var sysDtVal;
                    var sCommand;

                    sysDtVal = sysDateExcelNm.getFullYear()+"-";
                    sysDtVal += sysDateExcelNm.getMonth()+1;
                    sysDtVal += "-"+sysDateExcelNm.getDate();
                    sysDtVal += "-"+sysDateExcelNm.getHours()+sysDateExcelNm.getMinutes()+sysDateExcelNm.getSeconds();

                    if ( dms.string.isNotEmpty($("#sCustTags").data("kendoMultiSelect").value())){
                        sCommand = "TAGSEARCH";
                    } else {
                        sCommand = "";
                    };

                    if ( (dms.string.isNotEmpty(sSaleDtFrom) && dms.string.isEmpty(sSaleDtTo)) ||
                            (dms.string.isEmpty(sSaleDtFrom) && dms.string.isNotEmpty(sSaleDtTo))
                    ){
                        dms.notification.warning("<spring:message code='sal.lbl.saleDt' var='returnMsg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${returnMsg}' />");
                        return false;
                    };

                    if ( (dms.string.isNotEmpty(sRoDtFrom) && dms.string.isEmpty(sRoDtTo)) ||
                            (dms.string.isEmpty(sRoDtFrom) && dms.string.isNotEmpty(sRoDtTo))
                    ){
                        dms.notification.warning("<spring:message code='crm.lbl.latestRoDt' var='returnMsg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${returnMsg}' />");
                        return false;
                    };

                    dms.ajax.excelExport({
                        "beanName":"customerInfoService"
                        ,"templateFile":"CustomerInfoExp_Tpl.xlsx"
                        ,"fileName":"<spring:message code='crm.menu.custMng' />_"+sysDtVal+".xlsx"
                        ,"sExcelTp":"CustomerInfoMgmtList"
                        ,"sMngScId":$("#sMngScId").data("kendoExtDropDownList").value()
                        ,"sCustNm":$("#sCustNm").val()
                        ,"sCustCd":$("#sCustCd").data("kendoExtDropDownList").value()
                        ,"sHpNo":$("#sHpNo").val()
                        ,"sCustNo":$("#sCustNo").val()
                        ,"sSsnCrnNo":$("#sSsnCrnNo").val()
                        ,"tagDS":$("#sCustTags").data("kendoMultiSelect").value()
                        ,"sCustCollSrcCd":$("#sCustCollSrcCd").data("kendoExtDropDownList").value()
                        ,"sCommand":sCommand
                        ,"sSaleDtFrom":setKendoDate(sSaleDtFrom)
                        ,"sSaleDtTo":setKendoDate(sSaleDtTo)
                        ,"sRoDtFrom":setKendoDate(sRoDtFrom)
                        ,"sRoDtTo":setKendoDate(sRoDtTo)
                        ,"sCustTp":$("#sCustTp").data("kendoExtDropDownList").value()
                        ,"sVinNo":$("#sVinNo").val()
                        ,"sCarRegNo":$("#sCarRegNo").val()
                        //20200825 tjx 添加创建时间筛选条件
                        ,"sRegDtFrom":setKendoDate($("#sRegDtFrom").val())
                        ,"sRegDtTo":setKendoDate($("#sRegDtTo").val())
                    });

                }
            });

        }
        ,enable:false
    });

    // 고객상세화면
    $("#btnModify").kendoButton({
        click:function(e){
            var grid = $("#customerGrid").data("kendoExtGrid")
            , dataItem = grid.dataItem(grid.select())
            ;

            if ( dms.string.isEmpty(dataItem)){
                dms.notification.info("<spring:message code='global.lbl.customer' var='returnMsg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${returnMsg}' />");
                return false;
            }

            window.parent._createOrReloadTabMenu("<spring:message code='crm.menu.custInfo' />", "<c:url value='/crm/cif/customerInfo/selectCustomerInfoMain.do' />?custNo="+dataItem.custNo, "VIEW-D-10271"); // CUST NO
        }
    });

    // 태그관리링크
    $("#btnTagLink").kendoButton({
        click:function(e){
            window.parent._createOrReloadTabMenu("<spring:message code='crm.menu.tagMng' />", "<c:url value='/crm/cif/customerGroup/selectCustomerTagMain.do' />", "VIEW-D-10281"); // 태그관리
        }
    });

    //그리드 설정 (그룹 CRUD)
    $("#customerGrid").kendoExtGrid({
        gridId:"G-CRM-0816-141770"
        , dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/crm/cif/customerRegistPresent/customerListSearch.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};
                        var mngScIdCtrl = "${mngScIdCtrl}";
                        var usrId = "${usrId}";

                        params["recordCountPerPage"]     = options.pageSize;
                        params["pageIndex"]              = options.page;
                        params["firstIndex"]             = options.skip;
                        params["lastIndex"]              = options.skip + options.take;
                        params["sort"]                   = options.sort;

                        params = $.extend(params, gridCommonParams());

                        return kendo.stringify(params);
                    }else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,schema:{
                errors:"error"
                , model:{
                    id:"rnum"
                    , fields:{
                        rnum:{type:"number"}
                        , custNo       :{type:"string", editable:false}
                        , custNm       :{type:"string", editable:false}
                        , custTp       :{type:"string", editable:false}
                        , hpNo         :{type:"string", editable:false}
                        , telNo        :{type:"string", editable:false}
                        , regDt        :{type:"date", editable:false}
                        , sungNm       :{type:"string", editable:false}
                        , cityNm       :{type:"string", editable:false}
                        , distNm       :{type:"string", editable:false}
                        , addrDetlCont :{type:"string", editable:false}
                        , mathDocTp    :{type:"string", editable:false}
                        , ssnCrnNo     :{type:"string", editable:false}
                        , saleDt:{type:"date"}
                        , regDt:{type:"date"}
                        , roDt:{type:"date"}
                    }
                }
                ,parse:function(d) {
                    if(d.data){
                        $.each(d.data, function(idx, elem) {
                            elem.regDtFormat = kendo.parseDate(elem.regDt, "<dms:configValue code='dateFormat' />");
                            elem.saleDtFormat = kendo.parseDate(elem.saleDt, "<dms:configValue code='dateFormat' />");
                            elem.roDtFormat = kendo.parseDate(elem.roDt, "<dms:configValue code='dateFormat' />");
                        });
                    }
                    return d;
                }
            }

        }
        ,dataBound:function (e) {
            var dataItems = e.sender.dataSource.view();

            if ( dataItems.length > 0 ) {
                $("#btnCtlExcelExport").data("kendoButton").enable(true);
            } else {
                $("#btnCtlExcelExport").data("kendoButton").enable(false);
            };
        }
        ,columns:[
                    {field:"rnum", title:"<spring:message code='global.lbl.no' />", width:40, sortable:false
                                ,attributes:{"class":"ac"}
                    }
                    , {field:"custTp" , title:"<spring:message code='global.lbl.custTp' />", width:80, attributes:{"class":"ac"}, sortable:false
                        , template:"#if (custTp != null && custTpMap[custTp] != undefined){# #= custTpMap[custTp]# #}#"}
                    , {field:"custNo" , title:"<spring:message code='global.lbl.custNo' />",  width:140, attributes:{"class":"ac"}
                    }
                    , {field:"custNm" , title:"<spring:message code='global.lbl.custNm' />",  width:120, attributes:{"class":"ac"}
                    }
                    , {field:"sexCd"   , title:"<spring:message code='global.lbl.sex' />", width:30, attributes:{"class":"ac"}
                        ,attributes:{"class":"ac"}
                        ,template:function(dataItem){
                            var spanObj = "";
                            if (dataItem.sexCd == 'M') {
                                spanObj = "<span class='icon_male'></span>";
                            } else if (dataItem.sexCd == 'F') {
                                spanObj = "<span class='icon_female'></span>";
                            }
                            return spanObj;
                        }
                    } // 성별
                    , {field:"birthDt"  , title:"<spring:message code='global.lbl.birthday' />", width:100, attributes:{"class":"ac"}} // 생일
                    , {field:"custCd" , title:"<spring:message code='global.lbl.custCd' />", width:100, attributes:{"class":"ac"}, sortable:false
                        , template:"#if (custCd != null && custCdMap[custCd] != undefined){# #= custCdMap[custCd]# #}#"}
                    , {field:"hpNo"   , title:"<spring:message code='global.lbl.hpNo' />", width:120, attributes:{"class":"ac"}}
                    , {field:"telNo"  , title:"<spring:message code='global.lbl.officeTelNo' />", width:120, attributes:{"class":"ac"}}
                     /* 2018-12-27 update byfengdequan查询列表的公司客户固定电话不显示 start */
                        /* , template:"#if (data.custTp == '01'){# #= dms.string.strNvl(data.telNo)# #} else {# #= dms.string.strNvl(data.officeTelNo)# #}#" } */
                        /* 2018-12-27 update byfengdequan查询列表的公司客户固定电话不显示 end */
                    , {field:"mathDocTp"  , title:"<spring:message code='global.lbl.mathDocTp' />", width:100, attributes:{"class":"ac"}, sortable:false
                        , template:"#if (mathDocTp != null && mathDocTpMap[mathDocTp] != undefined){# #= mathDocTpMap[mathDocTp]# #}#" } // 증서유형
                    , {field:"ssnCrnNo"  , title:"<spring:message code='global.lbl.ssnCrnNo' />", width:120, attributes:{"class":"ac"}}
                    , {field:"hpNoInvldYn"  , title:"<spring:message code='global.lbl.hpNoInvld' />", width:90
                        , attributes:{"class":"ac"}
                        ,template:function(dataItem){
                            var spanObj = "";
                            if (dataItem.hpNoInvldYn == 'Y') {
                                spanObj = "<span class='icon_ok'></span>";
                            }
                            return spanObj;
                        }
                    }  // 핸드폰번호무효  (법인검증무효)
                    , {field:"hpNoAddImposYn"  , title:"<spring:message code='global.lbl.hpNoAddImpos' />", width:90
                        , attributes:{"class":"ac"}
                        ,template:function(dataItem){
                            var spanObj = "";
                            if (dataItem.hpNoAddImposYn == 'Y') {
                                spanObj = "<span class='icon_ok'></span>";
                            }
                            return spanObj;
                        }
                    }  // 핸드폰번호수정불가 (딜러갱신불가)
                    , {field:"sungNm", title:"<spring:message code='global.lbl.sungNm' />", width:100, attributes:{"class":"al"}, sortable:false}       // 성
                    , {field:"cityNm", title:"<spring:message code='global.lbl.cityNm' />", width:100, attributes:{"class":"al"}, sortable:false}       // 도시
                    , {field:"distNm", title:"<spring:message code='global.lbl.distNm' />", width:100, attributes:{"class":"al"}, sortable:false}       // 지역
                    , {field:"addrDetlCont", title:"<spring:message code='global.lbl.detlAddr' />", width:150, attributes:{"class":"al"}, sortable:false}  // 상세주소
                    , {field:"mngScNm", title:"<spring:message code='crm.lbl.scId' />", width:100, attributes:{"class":"ac"}, sortable:false}       // 책임자
                    , {field:"blueMembershipNo"  , title:"<spring:message code='crm.lbl.blueMembershipYn' />", width:90, sortable:false
                        , attributes:{"class":"ac"}
                        ,template:function(dataItem){
                            var spanObj = "";
                            if (dms.string.isNotEmpty(dataItem.blueMembershipNo)) {   //
                                spanObj = "<span class='icon_ok'></span>";
                            }
                            return spanObj;
                        }
                    }  // 블루멤버십 BLUE_MEMBERSHIP_NO
                    , {field:"dlrMbrYn"  , title:"<spring:message code='crm.lbl.mbrShipTpYn' />", width:90, sortable:false
                        , attributes:{"class":"ac"}
                        ,template:function(dataItem){
                            var spanObj = "";
                            if (dms.string.isNotEmpty(dataItem.dlrMbrYn)) {   //
                                spanObj = "<span class='icon_ok'></span>";
                            }
                            return spanObj;
                        }
                    }  // 딜러멤버십
                    , {field:"saleDtFormat"  , title:"<spring:message code='sal.lbl.saleDt' />", width:100, attributes:{"class":"ac"}, sortable:false
                        ,template:"#if (saleDtFormat !== null ){# #= kendo.toString(data.saleDt, '<dms:configValue code='dateFormat' />') # #} else {# #= '' # #}#"
                    }//판매일자
                    , {field:"roDtFormat"  , title:"<spring:message code='crm.lbl.latestRoDt' />", width:100, attributes:{"class":"ac"}, sortable:false
                        ,template:"#if (roDtFormat !== null ){# #= kendo.toString(data.roDt, '<dms:configValue code='dateFormat' />') # #} else {# #= '' # #}#"
                    }//마지막정비일자
                    , {field:"custCollSrcCd"  , title:"<spring:message code='crm.lbl.custCollSrc' />", width:100, attributes:{"class":"ac"}
                        , sortable:false
                        , template:"#if (custCollSrcCd != null && custCollSrcCdMap[custCollSrcCd] != undefined){# #= custCollSrcCdMap[custCollSrcCd]# #}#"
                    }// 고객 수집 경로
                    , {field:"tagTxt"  , title:"<spring:message code='global.lbl.tag' />", width:100, attributes:{"class":"al"}
                        , sortable:false
                    }// 태그
                    , {field:"leadStatCd"  , title:"<spring:message code='crm.lbl.leadStat' />", width:80, attributes:{"class":"ac"}
                        , sortable:false
                        //, template:"#if (leadStatCd != null){# #= leadStatCdMap[leadStatCd]# #}#"
                            ,template:function(dataItem){
                                var spanObj = "";
                                if (dataItem.leadStatCd == "01"
                                        || dataItem.leadStatCd == "02"
                                        || dataItem.leadStatCd == "03"
                                        || dataItem.leadStatCd == "04"
                                        || dataItem.leadStatCd == "05"
                                        ) {
                                    spanObj = leadStatCdMap[dataItem.leadStatCd];;
                                } else {
                                    spanObj = "-";
                                }
                                return spanObj;
                            }
                    }//판매기회단계
                    , {field:"ageDtl", title:"<spring:message code='global.lbl.age' />", width:50, attributes:{"class":"ac"}, sortable:false}       // 나이
                    , {field:"chinaZodiacSignCd", title:"<spring:message code='global.lbl.chinaZodiacSign' />", width:100, attributes:{"class":"ac"}
                        , sortable:false
                        , template:"#if (chinaZodiacSignCd != null && chinaZodiacSignCdMap[chinaZodiacSignCd] != undefined){# #= chinaZodiacSignCdMap[chinaZodiacSignCd]# #}#"
                    }       // 띠
                    , {field:"carlineCd", title:"<spring:message code='crm.lbl.carModelNm' />", width:100, attributes:{"class":"ac"}
                        , sortable:false
                        , template:"#if (carlineCd != null && carlineCdMap[carlineCd] != undefined){# #= carlineCdMap[carlineCd]# #}#"
                    }       //차종
                    , {field:"carRegNo", title:"<spring:message code='global.lbl.licensePlt' />", width:100, attributes:{"class":"ac"}, sortable:false}       //차번호판
                    , {field:"carRunDistVal", title:"<spring:message code='crm.lbl.runDistVal' />", width:100, attributes:{"class":"ar"}, sortable:false
                        ,format:"{0:n0}"
                    }       //주행거리
                    , {field:"regDtFormat"  , title:"<spring:message code='global.lbl.regDt' />", width:130, attributes:{"class":"ac"}
                        ,template:"#if (regDtFormat !== null ){# #= kendo.toString(data.regDt, '<dms:configValue code='dateFormat' /> HH:mm') # #} else {# #= '' # #}#"
                    }//등록일자
                ]
             ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
             ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
             ,appendEmptyColumn:false           //빈컬럼 적용. default:false
             ,enableTooltip:true               //Tooltip 적용, default:false
             ,multiSelectWithCheckbox:true
             ,navigatable:false
             ,sortable:true
             ,editable:false
//              ,selectable:"row"
             ,autoBind:true
    });
});

function fnChkDateValue(e){

    var  elmt  = e.sender.element[0],
         id    = elmt.id,
         toYY,
         toMM,
         toDD,
         frYY,
         frMM,
         frDD;

    if(this.value() == null){
        if(id === 'sSaleDtFrom'){
            var minDate = new Date(toDt);
            frYY = minDate.getFullYear();
            frMM = minDate.getMonth();
            frDD = minDate.getDate();
        }else if(id === 'sSaleDtTo'){
            var maxDate = new Date(toDt);
            toYY = maxDate.getFullYear();
            toMM = maxDate.getMonth();
            toDD = maxDate.getDate();
        }

        if(id === 'sRoDtFrom'){
            var minDate = new Date(toDt);
            frYY = minDate.getFullYear();
            frMM = minDate.getMonth();
            frDD = minDate.getDate();
        }else if(id === 'sRoDtTo'){
            var maxDate = new Date(toDt);
            toYY = maxDate.getFullYear();
            toMM = maxDate.getMonth();
            toDD = maxDate.getDate();
        }
    }else{
        if(id === 'sSaleDtFrom'){
            frYY = this.value().getFullYear();
            frMM = this.value().getMonth();
            frDD = this.value().getDate();
            $("#sSaleDtTo").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));
        }else if(id === 'sSaleDtTo'){
            toYY = this.value().getFullYear();
            toMM = this.value().getMonth();
            toDD = this.value().getDate();
            $("#sSaleDtFrom").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
        }

        if(id === 'sRoDtFrom'){
            frYY = this.value().getFullYear();
            frMM = this.value().getMonth();
            frDD = this.value().getDate();
            $("#sRoDtTo").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));
        }else if(id === 'sRoDtTo'){
            toYY = this.value().getFullYear();
            toMM = this.value().getMonth();
            toDD = this.value().getDate();
            $("#sRoDtFrom").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
        }
    }
 }

function fn_passwdChk(pwd){
    // 비밀번호 체크 시작
    var usrPw = hex_sha2(pwd);

    if (dms.string.isEmpty(pwd)) {
        dms.notification.info("<spring:message code='crm.info.emptyPw' />");
        return false;
    }

    var pwParam = {};

    pwParam["sPassword"] = usrPw;

    console.log("pwParam !!! ");
//     console.log(pwParam);
    var responseJson = dms.ajax.getJson({
        url:"<c:url value='/crm/cso/salesOpptProcessMgmt/selectUserPassWordCheck.do' />"
        ,data:JSON.stringify(pwParam)
        ,async:false
    });

    return responseJson;
}

</script>
<!-- //script end -->
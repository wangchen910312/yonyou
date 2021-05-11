<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<section class="group">
    <div class="header_area">
        <div class="btn_right">
            <button class="btn_m btn_tempSave" id="btnPopupTempSave"><spring:message code="global.btn.tempSave" /><!-- 임시저장 --></button>
            <button class="btn_m btn_save" id="btnPopupSave"><spring:message code="global.btn.save" /></button>
            <%-- <button class="btn_m btn_cancel" id="btnPopupClose"><spring:message code="global.btn.close" /></button> --%>
        </div>
    </div>

    <div class="table_form">
        <form id="saveForm">
            <table>
                <caption></caption>
                <colgroup>
                    <col style="width:10%;">
                    <col style="width:15%;">
                    <col style="width:10%;">
                    <col style="width:15%;">
                    <col style="width:10%;">
                    <col style="width:15%;">
                    <col style="width:25%;">
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row"><spring:message code="global.lbl.docNm" /></th>
                        <td>
                            <input type="hidden" id="usrDefReqDocId" name="usrDefReqDocId" value="" />
                            <input type="hidden" id="tempYn" name="tempYn" value="" />

                            <input type="text" id="usrDefReqDocNm" name="usrDefReqDocNm" class="form_input" />
                        </td>
                        <th scope="row"><spring:message code="global.lbl.startDt" /><!-- 시작일 --></th>
                        <td>
                            <input type="text" id="startDt" name="startDt" class="form_datepicker" />
                        </td>
                        <th scope="row"><spring:message code="global.lbl.endDt" /><!-- 종료일 --></th>
                        <td>
                            <input type="text" id="endDt" name="endDt" class="form_datepicker" />
                        </td>
                        <td></td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="global.lbl.docCont" /><!-- 문서 설명 --></th>
                        <td colspan="5">
                            <input type="text" id="usrDefReqCont" name="usrDefReqCont" class="form_input" />
                        </td>
                        <td></td>
                    </tr>
                </tbody>
            </table>
        </form>
    </div>

    <div class="header_area">
        <h2 class="title_basic"><spring:message code="global.title.targetList" /><!-- 대상자 리스트 --></h2>
        <div class="left_area mt5">
            <form id="searchForm">
                <input type="hidden" id="sUsrDefReqDocId" name="sUsrDefReqDocId" />

                <input type="text" id="sDiviCd" name="sDiviCd" class="form_comboBox" style="width:150px;" />
                <input type="text" id="sOfficeCd" name="sOfficeCd" class="form_comboBox" style="width:150px;" />
            </form>
        </div>

        <div class="btn_right">
            <button class="btn_s btn_add" id="btnTargetAdd"><spring:message code="global.btn.add" /></button>
            <button class="btn_s btn_delete" id="btnTargetDelete"><spring:message code="global.btn.del" /></button>
            <button class="btn_s btn_cancel" id="btnTargetCancel"><spring:message code="global.btn.cancel" /></button>
        </div>
    </div>

    <div class="table_grid">
        <div id="targetGrid" class="grid"></div>
    </div>

    <div class="table_grid">
        <div class="header_area">
            <h2 class="title_basic"><spring:message code="global.title.surveyList" /><!-- 문항 리스트 --></h2>

            <div class="btn_right">
                <button class="btn_s" id="btnSurveyPreview"><spring:message code="global.btn.preview" /><!-- 미리보기 --></button>
                <button class="btn_s btn_add" id="btnSurveyAdd"><spring:message code="global.btn.rowAdd" /></button>
                <button class="btn_s btn_delete" id="btnSurveyDelete"><spring:message code="global.btn.rowDel" /></button>
                <button class="btn_s btn_cancel" id="btnSurveyCancel"><spring:message code="global.btn.cancel" /></button>
            </div>
        </div>

        <div id="surveyGrid" class="grid"></div>
    </div>

</section>

<script type="text/javascript">
    // 문항 유형 List
    var arrUserDefinedTp = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];

    <c:forEach var="obj" items="${arrUserDefinedTp}">
    arrUserDefinedTp.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>

    // 사업부 List
    var arrBusinessListTp = [{"diviCd":"", "diviNm":""}];

    <c:forEach var="obj" items="${businessListTp}">
    arrBusinessListTp.push({
        "diviCd":"${obj.diviCd}"
        ,"diviNm":"${obj.diviNm}"
    });
    </c:forEach>

    // 사무소 List
    var arrOfficeListTp = [{"officeCd":"", "officeNm":""}];

    $("#sOfficeCd").kendoExtDropDownList({
        dataTextField:"officeNm"
        ,dataValueField:"officeCd"
        ,dataSource:arrOfficeListTp
        ,enable:true
    });

    var arrUserDefinedMap = dms.data.arrayToMap(arrUserDefinedTp, function(obj){ return obj.cmmCd; });

    fnOfficeList = function() {
        var searchData = "";

        searchData = $("#searchForm").serializeObject();

        $.ajax({
            url:"<c:url value='/cmm/sci/userDefined/selectOfficeByCondition.do' />"
            ,data:JSON.stringify(searchData)
            ,type:'POST'
            ,dataType:'json'
            ,contentType:'application/json'
            ,error:function(jqXHR,status,error) {
                dms.notification.error(jqXHR.responseJSON.errors);
            }
            ,beforeSend:function() {
                var officeDropDownlist = $("#sOfficeCd").data("kendoExtDropDownList");
                officeDropDownlist.enable(false);
            }
            ,success:function(jqXHR, textStatus) {
                arrOfficeListTp = [{"officeCd":"", "officeNm":""}];

                $.each(jqXHR, function(index, value) {
                    arrOfficeListTp.push({
                        "officeCd":value.officeCd
                        ,"officeNm":value.officeNm
                    });
                });

                // Dealer DropDownList
                $("#sOfficeCd").kendoExtDropDownList({
                    dataTextField:"officeNm"
                    ,dataValueField:"officeCd"
                    ,dataSource:arrOfficeListTp
                    ,enable:true
                });
            }
            ,complete:function() {
                var officeDropDownlist = $("#sOfficeCd").data("kendoExtDropDownList");
                officeDropDownlist.enable(true);
            }
        });
    }

    $("#sDiviCd").kendoExtDropDownList({
        dataTextField:"diviNm"
        ,dataValueField:"diviCd"
        ,dataSource:arrBusinessListTp
        ,index:0
        ,change:fnOfficeList
    });

    // 시작일
    $("#startDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });

    // 종료일
    $("#endDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });

    // 미리보기 팝업
    var userDefinedPreviewPopupWin;

    fnUserDefinedPreviewPopup = function() {
        userDefinedPreviewPopupWin = dms.window.popup({
           windowsId:"userDefinedPreviewPopupWin"
         , title:"<spring:message code='cmm.title.userDefinedPreview' />"/* 사용자 정의 미리보기 */
         , content:{
              url:"<c:url value='/cmm/sci/userDefined/selectUserDefinedPreviewPopup.do' />"
            , data:{
                 "autoBind":false
               , "usrDefReqDocId":"<c:out value='${usrDefReqDocId}' />"
               , "callbackFunc":function(data){

                 }
              }
           }
         , height:400
        });
    }

    fnTabInit = function() {
        var searchData = $("#searchForm").serializeObject();

        $.ajax({
            url:"<c:url value='/cmm/sci/userDefined/selectUserDefinedByKey.do' />"
          , data:JSON.stringify(searchData)
          , type:'POST'
          , dataType:'json'
          , async:false
          , contentType:'application/json'
          , error:function(jqXHR,status,error) {
                dms.notification.error(jqXHR.responseJSON.errors);
            }
          , success:function(jqXHR, textStatus) {
                $("#usrDefReqDocNm").val(jqXHR.usrDefReqDocNm);
                $("#startDt").val(jqXHR.startDt);
                $("#endDt").val(jqXHR.endDt);
                $("#usrDefReqCont").val(jqXHR.usrDefReqCont);

                if (jqXHR.tempYn == "Y") {
                    $("#btnPopupTempSave").show();
                }
                else {
                    $("#btnPopupTempSave").hide();
                }

                if (jqXHR.docRefYn == "Y") {
                    $("#btnPopupSave").hide();
                }
                else {
                    $("#btnPopupSave").show();
                }
            }
        });
    }

    fnCalendarValidation = function(startDate, endDate) {
        var result = false;

        if ($("#" + startDate).val() == "") {
            dms.notification.info("<spring:message code='global.info.fromDate.input' />"); /* 시작일을 입력하시기 바랍니다. */

            return false;
        }

        if ($("#" + endDate).val() == "") {
            dms.notification.info("<spring:message code='global.info.toDate.input' />"); /* 종료일을 입력하시기 바랍니다. */

            return false;
        }

        if (parseInt($("#" + startDate).val().replace(/-/g, '')) > parseInt($("#" + endDate).val().replace(/-/g, ''))) {
            dms.notification.info("<spring:message code='cmm.info.endDateGreat' />"); /* 시작일이 종료일보다 클 수 없습니다. */

            return false;
        }
        else {
            result = true;
        }

        if (parseInt($("#" + startDate).val().replace(/-/g, '')) > parseInt($("#" + endDate).val().replace(/-/g, ''))) {
            dms.notification.info("<spring:message code='cmm.info.endDateGreat' />"); /* 시작일이 종료일보다 클 수 없습니다. */

            return false;
        }
        else {
            result = true;
        }

        return result;
    };

    fnChange = function(e) {
        var surveyGrid = $("#surveyGrid").data("kendoExtGrid");
        var rows = surveyGrid.dataItem(this.element.closest(("tr")));

        rows.set("etcInsUseYn", "N");

        if (this.dataItem(this.select()).cmmCd != "01" && this.dataItem(this.select()).cmmCd != "02") {
            rows.fields["etcInsUseYn"].editable = false;
        }
        else {
            rows.fields["etcInsUseYn"].editable = true;
        }
    }

    $(document).ready(function() {
        $("#sUsrDefReqDocId").val("<c:out value='${usrDefReqDocId}' />");
        $("#usrDefReqDocId").val("<c:out value='${usrDefReqDocId}' />");

        if ("<c:out value='${usrDefReqDocId}' />" != "") {
            fnTabInit();
            $("#btnSurveyPreview").show();
        }
        else {
            $("#btnSurveyPreview").hide();
        }

        /************************************************************
                    기능버튼 설정
        *************************************************************/
        // 저장 버튼 - 임시 저장
        $("#btnPopupTempSave").kendoButton({
            click:function(e){
                var targetData = {};
                targetData["all"] = [];

                var surveyData = {};
                surveyData["all"] = [];

                if ($("#usrDefReqDocNm").val() == "") {
                    dms.notification.info("<spring:message code='global.info.docNmInput' />"); /* 문서명을 입력 하시기 바랍니다. */
                }

                if (!fnCalendarValidation("startDt", "endDt")) {
                    return;
                }

                var targetGrid = $("#targetGrid").data("kendoExtGrid");
                var surveyGrid = $("#surveyGrid").data("kendoExtGrid");

                $("#tempYn").val("Y");

                var saveData = $("#saveForm").serializeObject();
                var targetSaveData = targetGrid.dataSource;
                var surveySaveData = surveyGrid.dataSource;

                $(targetSaveData._flatData(targetSaveData._data)).each(function(idx, value){
                    targetData["all"].push(value);
                });

                $(surveySaveData._flatData(surveySaveData._data)).each(function(idx, value){
                    surveyData["all"].push(value);
                });

                json = "\"allTargetList\":[";

                $.each(targetData.all, function(index, value) {
                    json += "{\"dlrCd\":\"" + value.dlrCd + "\"}";

                    if (targetData.all.length > (index + 1)) {
                        json += ",";
                    }
                });

                json += "],\"allSurveyList\":[";

                $.each(surveyData.all, function(index, value) {
                    json += "{\"atcNm\":\"" + value.atcNm + "\", \"atcTp\":\"" + value.atcTp + "\", \"atcListCont\":\"" + value.atcListCont + "\", \"etcInsUseYn\":\"" + value.etcInsUseYn + "\", \"sortOrder\":\"" + value.sortOrder + "\"}";

                    if (surveyData.all.length > (index + 1)) {
                        json += ",";
                    }
                });

                json += "]";

                $.ajax({
                    url:"<c:url value='/cmm/sci/userDefined/multiUserDefined.do' />"
                  , data:JSON.stringify(saveData).replace("}", "") + "," + json +"}"
                  , type:'POST'
                  , dataType:'json'
                  , async:false
                  , contentType:'application/json'
                  , error:function(jqXHR,status,error) {
                        dms.notification.error(jqXHR.responseJSON.errors);
                    }
                  , success:function(jqXHR, textStatus) {
                        //정상적으로 반영 되었습니다.
                        dms.notification.success("<spring:message code='global.info.success'/>");

                        /* $('#targetGrid').data('kendoExtGrid').dataSource.page(1);
                        $('#surveyGrid').data('kendoExtGrid').dataSource.page(1); */
                    }
                });
            }
        });

        // 저장 버튼
        $("#btnPopupSave").kendoButton({
            click:function(e){
                var targetData = {};
                targetData["all"] = [];

                var surveyData = {};
                surveyData["all"] = [];

                var targetGrid = $("#targetGrid").data("kendoExtGrid");
                var surveyGrid = $("#surveyGrid").data("kendoExtGrid");

                $("#tempYn").val("N");

                var saveData = $("#saveForm").serializeObject();
                var targetSaveData = targetGrid.dataSource;
                var surveySaveData = surveyGrid.dataSource;

                $(targetSaveData._flatData(targetSaveData._data)).each(function(idx, value){
                    targetData["all"].push(value);
                });

                $(surveySaveData._flatData(surveySaveData._data)).each(function(idx, value){
                    surveyData["all"].push(value);
                });

                if (!fnCalendarValidation("startDt", "endDt")) {
                    return;
                }

                if (targetData.all.length == 0) {
                    dms.notification.info("<spring:message code='global.info.targetInput' />"); /* 대상자를 지정하시기 바랍니다. */

                    return;
                }

                if (surveyData.all.length == 0) {
                    dms.notification.info("<spring:message code='global.info.surveyInput' />"); /* 문항을 입력하시기 바랍니다. */

                    return;
                }

                json = "\"allTargetList\":[";

                $.each(targetData.all, function(index, value) {
                    json += "{\"dlrCd\":\"" + value.dlrCd + "\"}";

                    if (targetData.all.length > (index + 1)) {
                        json += ",";
                    }
                });

                json += "],\"allSurveyList\":[";

                $.each(surveyData.all, function(index, value) {
                    json += "{\"atcNm\":\"" + value.atcNm + "\", \"atcTp\":\"" + value.atcTp + "\", \"atcListCont\":\"" + value.atcListCont + "\", \"etcInsUseYn\":\"" + value.etcInsUseYn + "\", \"sortOrder\":\"" + value.sortOrder + "\"}";

                    if (surveyData.all.length > (index + 1)) {
                        json += ",";
                    }
                });

                json += "]";

                $.ajax({
                    url:"<c:url value='/cmm/sci/userDefined/multiUserDefined.do' />"
                  , data:JSON.stringify(saveData).replace("}", "") + "," + json +"}"
                  , type:'POST'
                  , dataType:'json'
                  , async:false
                  , contentType:'application/json'
                  , error:function(jqXHR,status,error) {
                        dms.notification.error(jqXHR.responseJSON.errors);
                    }
                  , success:function(jqXHR, textStatus) {
                        //정상적으로 반영 되었습니다.
                        dms.notification.success("<spring:message code='global.info.success'/>");

                        $("#btnPopupTempSave").hide();

                        /* $('#targetGrid').data('kendoExtGrid').dataSource.page(1);
                        $('#surveyGrid').data('kendoExtGrid').dataSource.page(1); */
                    }
                });
            }
        });

        // 닫기 버튼.
        $("#btnPopupClose").kendoButton({
            click:function(e){
                parent.userDefinedPopupWin.close();
            }
        });

        $("#btnTargetAdd").kendoButton({
            click:function(e) {
                var searchData = $("#searchForm").serializeObject();

                var jsonData = [];

                $.ajax({
                    url:"<c:url value='/cmm/sci/userDefined/selectUserDefinedTargetList.do' />"
                    ,data:JSON.stringify(searchData)
                    ,type:'POST'
                    ,dataType:'json'
                    ,contentType:'application/json'
                    ,error:function(jqXHR,status,error) {
                        dms.notification.error(jqXHR.responseJSON.errors);
                    }
                    ,success:function(jqXHR, textStatus) {
                        $.each(jqXHR.data, function(index, value) {
                            jsonData.push({
                                "rnum":"0"
                              , "dlrCd":value.dlrCd
                              , "dlrNm":value.dlrNm
                            });
                        });

                        $.each($('#targetGrid').data('kendoExtGrid').dataSource.data(), function(index, value) {
                            jsonData.push({
                                "rnum":"0"
                              , "dlrCd":value.dlrCd
                              , "dlrNm":value.dlrNm
                            });
                        });

                        $('#targetGrid').data('kendoExtGrid').dataSource.data(jsonData);
                    }
                });
            }
        });

        // 버튼 - 행 삭제 (Target)
        $("#btnTargetDelete").kendoButton({
            click:function(e) {
                var grid = $("#targetGrid").data("kendoExtGrid");
                var rows = grid.select();

                if (rows.length < 1) {
                    //목록을 선택하여 주십시오.
                    dms.notification.info("<spring:message code='global.info.required.select'/>");
                    return;
                }

                rows.each(function(index, row) {
                    grid.removeRow(row);
                });
            }
        });

        // 버튼 - 취소 (Target)
        $("#btnTargetCancel").kendoButton({
            click:function(e) {
                $('#targetGrid').data('kendoExtGrid').cancelChanges();
            }
        });

        // 버튼 - 미리보기 (Surver)
        $("#btnSurveyPreview").kendoButton({
            click:function(e) {
                fnUserDefinedPreviewPopup();
            }
        });

        // 버튼 - 행 추가 (Survey)
        $("#btnSurveyAdd").kendoButton({
            click:function(e) {
                $('#surveyGrid').data('kendoExtGrid').dataSource.insert(0);
            }
        });

        // 버튼 - 행 삭제 (Survey)
        $("#btnSurveyDelete").kendoButton({
            click:function(e) {
                var grid = $("#surveyGrid").data("kendoExtGrid");
                var rows = grid.select();

                if (rows.length < 1) {
                    //목록을 선택하여 주십시오.
                    dms.notification.info("<spring:message code='global.info.required.select'/>");
                    return;
                }

                rows.each(function(index, row) {
                    grid.removeRow(row);
                });
            }
        });

        // 버튼 - 취소 (Survey)
        $("#btnSurveyCancel").kendoButton({
            click:function(e) {
                $('#surveyGrid').data('kendoExtGrid').cancelChanges();
            }
        });

        /************************************************************
                    그리드 설정
        *************************************************************/
        //그리드 설정
        $("#targetGrid").kendoExtGrid({
            dataSource:{
                 transport:{
                    read:{
                        url:"<c:url value='/cmm/sci/userDefined/selectUserDefinedTarget.do' />"
                    }
                    , parameterMap:function(options, operation) {
                        if (operation === "read") {
                            var params = {};

                            params["sUsrDefReqDocId"] = $("#sUsrDefReqDocId").val();

                            return kendo.stringify(params);
                        } else if (operation !== "read" && options.models) {
                            return kendo.stringify(options.models);
                        }
                    }
                }
                , schema:{
                    model:{
                        id:"rnum"
                        ,fields:{
                            rnum:{type:"number"}
                            ,dlrCd:{type:"string"}
                            ,dlrNm:{type:"string"}
                        }
                    }
                }
            }
            , editable:false
            , height:219
            , navigatable:false
            , pageable:false
            , resizable:false
            , multiSelectWithCheckbox:true
            , columns:[
                {field:"rnum", title:"<spring:message code='global.lbl.no' />", width:60, attributes:{"class":"ac"}}
              , {field:"dlrCd", title:"<spring:message code='global.lbl.dlrCd' />", width:200, attributes:{"class":"al"}}
              , {field:"dlrNm", title:"<spring:message code='global.lbl.dlrNm' />", width:200, attributes:{"class":"al"}}
              , {title:""}
            ]
        });

        // 그리드 설정
        $("#surveyGrid").kendoExtGrid({
            dataSource:{
                 transport:{
                    read:{
                        url:"<c:url value='/cmm/sci/userDefined/selectUserDefinedSurvey.do' />"
                    }
                    , parameterMap:function(options, operation) {
                        if (operation === "read") {
                            var params = {};

                            params["recordCountPerPage"] = options.pageSize;
                            params["pageIndex"] = options.page;
                            params["firstIndex"] = options.skip;
                            params["lastIndex"] = options.skip + options.take;
                            params["sort"] = options.sort;

                            params["sUsrDefReqDocId"] = $("#sUsrDefReqDocId").val();

                            return kendo.stringify(params);
                        } else if (operation !== "read" && options.models) {
                            return kendo.stringify(options.models);
                        }
                    }
                }
                , schema:{
                    model:{
                        id:"atcNo"
                      , fields:{
                            rnum:{type:"number", editable:false}
                          , atcNo:{type:"string", editable:false}
                          , atcNm:{type:"string", validation:{required:true}}
                          , atcTp:{type:"string", validation:{required:true}}
                          , atcListCont:{type:"string"}
                          , etcInsUseYn:{type:"string", validation:{required:true, pattern:"[Y|N]"}}
                          , sortOrder:{type:"number"}
                        }
                    }
                }
            }
            , height:219
            , navigatable:false
            , pageable:false
            , resizable:false
            , multiSelectWithCheckbox:true
            , editableOnlyNew:true
            , editableOnlyNewExcludeColumns:["atcNm", "atcTp", "atcListCont", "etcInsUseYn", "sortOrder"]
            , edit:onEdit
            , columns:[
                {field:"rnum", title:"<spring:message code='global.lbl.no' />" , width:60, sortable:false, attributes:{"class":"ac"}}
              , {field:"atcNm", title:"<spring:message code='global.lbl.survery' />", width:150}
              , {field:"atcTp", title:"<spring:message code='global.lbl.type' />", width:200
                  , template:"# if(arrUserDefinedMap[atcTp] != null) { # #= arrUserDefinedMap[atcTp].cmmCdNm# # }#"
                      , editor:function(container, options) {
                          $('<input required name="atcTp" data-bind="value:' + options.field + '"/>')
                          .appendTo(container)
                          .kendoExtDropDownList({
                              autoBind:false
                              ,dataTextField:"cmmCdNm"
                              ,dataValueField:"cmmCd"
                              ,dataSource:arrUserDefinedTp
                              ,change:fnChange
                          });
                          $('<span class="k-invalid-msg" data-for="atcTp"></span>').appendTo(container);
                      }
                  , attributes:{"class":"ac"}
                }
              , {field:"atcListCont",  title:"<spring:message code='global.lbl.explanation' />", width:200}
              , {field:"etcInsUseYn", title:"<spring:message code='global.lbl.etcInsUseYn' />", width:150, attributes:{"class":"ac"}
                  , editor:function(container, options) {
                      $('<input required name="etcInsUseYn" data-bind="value:' + options.field + '"/>')
                      .appendTo(container)
                      .kendoExtDropDownList({
                          autoBind:false
                          ,dataSource:["Y", "N"]
                      });

                      $('<span class="k-invalid-msg" data-for="useYn"></span>').appendTo(container);
                    }
                }
              , {field:"sortOrder", title:"<spring:message code='global.lbl.sortOrder' />", width:200, attributes:{"class":"ac"}}
              , {title:""}
            ]
        });

        function onEdit(e) {
            var grid = this;
            var model = e.model;
            var fieldName = grid.columns[e.container.index()].field;

            if(fieldName == "etcInsUseYn") {
                if (e.model.atcTp != "01" && e.model.atcTp != "02") {
                    this.closeCell();
                }
            }
        }
    });
</script>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 메세지소스 관리 -->
<section class="group">
    <!-- 조회 조건 타이틀 시작 -->
    <div class="header_area">
        <h1 class="title_basic"><spring:message code="cmm.title.calendarInfo" /></h1>
        <div class="btn_right">
            <button class="btn_m btn_search" id="btnCalendarSearch"><spring:message code="global.btn.search" /></button>
            <button class="btn_m btn_save" id="btnCalendarSave"><spring:message code="global.btn.save" /></button>
            <button class="btn_m btn_cancel" id="btnCalendarCancel"><spring:message code="global.btn.cancel" /></button>
        </div>
    </div>
    <!-- 조회 조건 타이틀 종료 -->

    <!-- 조회 조건 시작 -->
    <div class="table_form form_width_50per" role="search" data-btnid="btnSearch">
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
                    <th scope="row"><spring:message code="cmm.lbl.calendarTp" /><!-- 달력 유형 --></th>
                    <td>
                        <input type="hidden" id="sCalendarId" name="sCalendarId" />
                        <input type="text" id="sCalendarTp" name="sCalendarTp" class="form_comboBox" />
                    </td>
                    <th scope="row"><spring:message code="cmm.lbl.calendarNm" /><!-- 달력명 --></th>
                    <td>
                        <input type="text" id="sCalendarNm" name="sCalendarNm" class="form_input" />
                    </td>
                    <th scope="row"></th>
                    <td></td>
                    <th scope="row"></th>
                    <td></td>
                </tr>
            </tbody>
        </table>
    </div>
    <!-- 조회 조건 종료 -->

    <!-- 그리드 기능 버튼 시작 -->
    <div class="header_area">
        <div class="btn_right">
            <button class="btn_s btn_add" id="btnCalendarAdd"><spring:message code="global.btn.rowAdd" /></button>
            <button class="btn_s btn_del" id="btnCalendarDel"><spring:message code="global.btn.rowDel" /></button>
        </div>
    </div>
    <!-- 그리드 기능 버튼 종료 -->

    <!-- 그리드 시작 -->
    <div class="table_grid">
        <div id="calendarGrid"></div>
    </div>
    <!-- 그리드 종료 -->

    <div id="workingArea" >
        <form id="saveForm">
            <input type="hidden" id="calendarId" name="calendarId" />
            <input type="hidden" id="dayWeekList" name="dayWeekList" />
        </form>

        <div class="header_area">
            <h2 class="title_basic"><spring:message code="cmm.title.workingSet" /><!-- 근무일 설정 --></h2>

            <div class="btn_right">
                <button class="btn_s btn_save"  id="btnWorkingSave"><spring:message code="global.btn.save" /></button>
            </div>
        </div>

        <div class="table_form">
            <table>
                <caption></caption>
                <colgroup>
                    <col style="width:10%;">
                    <col style="width:24%;">
                    <col style="width:10%;">
                    <col style="width:23%;">
                    <col style="width:10%;">
                    <col>
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row"><spring:message code="global.lbl.selectWeek" /></th>
                        <td colspan="4" class="al">
                            <input type="checkbox" id="chkSunday" name="chkWeek"  value="1" /> <spring:message code="global.lbl.sunday" /> <!-- 일 -->
                            <input type="checkbox" id="chkMonday" name="chkWeek"  value="2" /> <spring:message code="global.lbl.monday" /> <!-- 월 -->
                            <input type="checkbox" id="chkTuesday" name="chkWeek"  value="3" /> <spring:message code="global.lbl.tuesday" /> <!-- 화 -->
                            <input type="checkbox" id="chkWednesday" name="chkWeek"  value="4" /> <spring:message code="global.lbl.wednesday" /> <!-- 수 -->
                            <input type="checkbox" id="chkThursday" name="chkWeek"  value="5" /> <spring:message code="global.lbl.thursday" /> <!-- 목 -->
                            <input type="checkbox" id="chkFriday" name="chkWeek"  value="6" /> <spring:message code="global.lbl.friday" /> <!-- 금 -->
                            <input type="checkbox" id="chkSaturday" name="chkWeek"  value="7" /> <spring:message code="global.lbl.saturday" /> <!-- 토 -->
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>

    <div id="holidayArea">
        <div class="header_area">
            <h2 class="title_basic"><spring:message code="global.lbl.holidayList" /></h2>
            <div class="btn_right">
                <button class="btn_s btn_add" id="btnHolidayAdd"><spring:message code="global.btn.rowAdd" /></button>
                <button class="btn_s btn_del" id="btnHolidayDel"><spring:message code="global.btn.rowDel" /></button>
                <button class="btn_s btn_save" id="btnHolidaySave"><spring:message code="global.btn.save" /></button>
                <button class="btn_s btn_cancel" id="btnHolidayCancel"><spring:message code="global.btn.cancel" /></button>
            </div>
        </div>

        <!-- 그리드 시작 -->
        <div class="table_grid">
            <div id="holidayGrid"></div>
        </div>
        <!-- 그리드 종료 -->
    </div>
</section>

<script type="text/javascript">
    // 달력 유형  Array
    var arrCalendarTp = [{"cmmCd":"", "cmmCdNm":""}];
    <c:forEach var="obj" items="${arrCalendarTp}">
        arrCalendarTp.push({
            "cmmCd":"${obj.cmmCd}"
          , "cmmCdNm":"${obj.cmmCdNm}"
        });
    </c:forEach>

    var supportedLangs = [{"langCd":"", "langNm":""}];
    <c:forEach var="obj" items="${supportedLangs}">
        supportedLangs.push({
            "langCd":"${obj}"
          , "langNm":"${obj}"
        });
    </c:forEach>

    var calendarTpMap = dms.data.arrayToMap(arrCalendarTp, function(obj){ return obj.cmmCd; });

    // 언어설정 설정 팝업
    var langTextPopupWin;

    fnTextPopup = function(calendarId) {
        langTextPopupWin = dms.window.popup({
           windowsId:"textPopupWin"
         , title:"<spring:message code='cmm.title.cmmCdLang' />"
         , content:{
              url:"<c:url value='/cmm/sci/calendarInfo/selectCalendarLangCdPopup.do' />"
            , data:{
                 "autoBind":false
               , "calendarId":calendarId
               , "callbackFunc":function(data){
                   // 정상적으로 반영 되었습니다.
                   dms.notification.success("<spring:message code='global.info.success'/>");
                 }
               , height:250
              }
           }
        });
    }

    $(document).ready(function() {
        $("#workingArea").hide();
        $("#holidayArea").hide();

        // 달력 유형 DropDownList
        $("#sCalendarTp").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
          , dataValueField:"cmmCd"
          , dataSource:arrCalendarTp
        });

        // 버튼 - 조회
        $("#btnCalendarSearch").kendoButton({
            click:function(e) {
                $("#sCalendarId").val("");
                $('#calendarGrid').data('kendoExtGrid').dataSource.page(1);

                $("#workingArea").hide();
                $("#holidayArea").hide();
            }
        });

        // 버튼 - 추가
        $("#btnCalendarAdd").kendoButton({
            click:function(e) {
                var setStartDate = "<c:out value='${startDt}' />";
                var setEndDate = "99991131";

                var startYear = setStartDate.substring(0, 4);
                var startMonth = parseInt(setStartDate.substring(4, 6)) - 1;
                var startDay = setStartDate.substring(6, 8);

                var startDate = new Date(startYear, startMonth, startDay);

                var endYear = setEndDate.substring(0, 4);
                var endMonth = setEndDate.substring(4, 6);
                var endDay = setEndDate.substring(6, 8);

                var endDate = new Date(endYear, endMonth, endDay);

                $('#calendarGrid').data('kendoExtGrid').dataSource.insert(0, {
                    "langCd":dms.string.defaultString("", "")
                  , "calendarId":dms.string.defaultString("", "")
                  , "calendarTp":dms.string.defaultString("", "")
                  , "startDt":startDate
                  , "endDt":endDate
                });
            }
        });

        // 버튼 - 삭제
        $("#btnCalendarDel").kendoButton({
            click:function(e) {
                var grid = $("#calendarGrid").data("kendoExtGrid");
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

        // 버튼 - 저장
        $("#btnCalendarSave").kendoButton({
            click:function(e) {
                $("#sCalendarId").val("");

                var grid = $("#calendarGrid").data("kendoExtGrid");

                var saveData = grid.getCUDData("insertList", "updateList", "deleteList");

                if (grid.cudDataLength == 0) {
                    //변경된 정보가 없습니다.
                    dms.notification.info("<spring:message code='global.info.required.change'/>");
                    return;
                }

                if (grid.gridValidation()) {
                    $.ajax({
                        url:"<c:url value='/cmm/sci/calendarInfo/multiCalendarInfo.do' />"
                       ,data:JSON.stringify(saveData)
                       ,type:'POST'
                       ,dataType:'json'
                       ,contentType:'application/json'
                       ,error:function(jqXHR, status, error) {
                            dms.notification.error(jqXHR.responseJSON.errors);
                        }
                       ,success:function(jqXHR, textStatus) {
                            grid.dataSource._destroyed = [];
                            grid.dataSource.page(1);

                            $("#workingArea").hide();
                            $("#holidayArea").hide();

                            //정상적으로 반영 되었습니다.
                            dms.notification.success("<spring:message code='global.info.success'/>");
                        }
                    });
                }
                else {
                    //입력값을 확인하여 주십시오.
                    dms.notification.warning("<spring:message code='global.info.check.input'/>");
                }
            }
        });

        // 버튼 - 취소
        $("#btnCalendarCancel").kendoButton({
            click:function(e) {
                $('#calendarGrid').data('kendoExtGrid').cancelChanges();
            }
        });

        // 버튼 - 근무일 설정 저장
        $("#btnWorkingSave").kendoButton({
            click:function(e) {
                var grid = $("#calendarGrid").data("kendoExtGrid");
                var rows = grid.select();

                if (rows.length != 1) {
                    //목록을 선택하여 주십시오.
                    dms.notification.info("<spring:message code='global.info.required.select'/>");
                    return;
                }
                else {
                    var saveData = "";
                    var chkWeek = "";

                    $("input:checkbox[name='chkWeek']").each(function() {
                        if (this.checked) {
                            if (chkWeek == "") {
                                chkWeek += $(this).val();
                            }
                            else {
                                chkWeek += "|" + $(this).val();
                            }
                        }
                    });

                    $("#calendarId").val($("#sCalendarId").val());
                    $("#dayWeekList").val(chkWeek);

                    saveData = $("#saveForm").serializeObject();

                    $.ajax({
                        url:"<c:url value='/cmm/sci/calendarInfo/insertWorking.do' />"
                      , data:JSON.stringify(saveData)
                      , type:'post'
                      , dataType:'json'
                      , contentType:'application/json'
                      , error:function(jqXHR, status, error) {
                            dms.notification.error(jqXHR.responseJSON.errors);
                        }
                      , success:function(jqXHR, textStatus) {
                            grid.dataSource._destroyed = [];
                            grid.dataSource.page(1);

                            //정상적으로 반영 되었습니다.
                            dms.notification.success("<spring:message code='global.info.success'/>");
                        }
                    });
                }
            }
        });

        //-----------------------------------------------------------------------------------------------
        // 버튼 - 추가
        $("#btnHolidayAdd").kendoButton({
            click:function(e) {
                var grid = $("#calendarGrid").data("kendoExtGrid");
                var rows = grid.select();

                if (rows.length != 1) {
                    //목록을 선택하여 주십시오.
                    dms.notification.info("<spring:message code='global.info.required.select'/>");
                    return;
                }
                else {
                    var setDate = "<c:out value='${startDt}' />";

                    var year = setDate.substring(0, 4);
                    var month = parseInt(setDate.substring(4, 6)) - 1;
                    var day = setDate.substring(6, 8);

                    var date = new Date(year, month, day);

                    $('#holidayGrid').data('kendoExtGrid').dataSource.insert(0, {
                        "calendarId":$("#sCalendarId").val()
                      , "oldHdayDt":date
                      , "newHdayDt":date
                    });
                }
            }
        });

        // 버튼 - 삭제
        $("#btnHolidayDel").kendoButton({
            click:function(e) {
                var grid = $("#holidayGrid").data("kendoExtGrid");
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

        // 버튼 - 저장
        $("#btnHolidaySave").kendoButton({
            click:function(e) {
                $("#sCalendarId").val("");

                var grid = $("#holidayGrid").data("kendoExtGrid");

                var saveData = grid.getCUDData("insertList", "updateList", "deleteList");

                if (grid.cudDataLength == 0) {
                    //변경된 정보가 없습니다.
                    dms.notification.info("<spring:message code='global.info.required.change'/>");
                    return;
                }

                if (grid.gridValidation()) {
                    $.ajax({
                        url:"<c:url value='/cmm/sci/calendarInfo/multiHoliday.do' />"
                       ,data:JSON.stringify(saveData)
                       ,type:'POST'
                       ,dataType:'json'
                       ,contentType:'application/json',
                        error:function(jqXHR, status, error) {
                            dms.notification.error(jqXHR.responseJSON.errors);
                        }
                       ,success:function(jqXHR, textStatus) {
                            grid.dataSource._destroyed = [];
                            grid.dataSource.page(1);

                            //정상적으로 반영 되었습니다.
                            dms.notification.success("<spring:message code='global.info.success'/>");
                        }
                    });
                }
                else {
                    //입력값을 확인하여 주십시오.
                    dms.notification.warning("<spring:message code='global.info.check.input'/>");
                }
            }
        });

        // 버튼 - 취소
        $("#btnHolidayCancel").kendoButton({
            click:function(e) {
                $('#holidayGrid').data('kendoExtGrid').cancelChanges();
            }
        });
        //-----------------------------------------------------------------------------------------------

        fnWorkingSetting = function(selectedVal) {
            var searchData = "";

            $("#calendarId").val(selectedVal.calendarId);

            searchData = $("#saveForm").serializeObject();

            $.ajax({
                url:"<c:url value='/cmm/sci/calendarInfo/selectWorking.do' />"
              , data:JSON.stringify(searchData)
              , type:'post'
              , dataType:'json'
              , contentType:'application/json'
              , error:function(jqXHR, status, error) {
                    dms.notification.error(jqXHR.responseJSON.errors);
                }
              , success:function(jqXHR, textStatus) {
                  $("input:checkbox[name='chkWeek']").prop("checked", false);

                  $.each(jqXHR, function(index, value) {
                      switch (value.dayweekCnt) {
                          case 1:
                              $("#chkSunday").prop("checked", true);
                              break;
                          case 2:
                              $("#chkMonday").prop("checked", true);
                              break;
                          case 3:
                              $("#chkTuesday").prop("checked", true);
                              break;
                          case 4:
                              $("#chkWednesday").prop("checked", true);
                              break;
                          case 5:
                              $("#chkThursday").prop("checked", true);
                              break;
                          case 6:
                              $("#chkFriday").prop("checked", true);
                              break;
                          case 7:
                              $("#chkSaturday").prop("checked", true);
                              break;
                          default:
                              break;
                      }
                  });
              }
          });
        }

        // 그리드 설정
        $("#calendarGrid").kendoExtGrid({
            dataSource:{
                 transport:{
                    read:{
                        url:"<c:url value='/cmm/sci/calendarInfo/selectCalendarInfo.do' />"
                    }
                    , parameterMap:function(options, operation) {
                        if (operation === "read") {
                            var params = {};

                            params["recordCountPerPage"] = options.pageSize;
                            params["pageIndex"] = options.page;
                            params["firstIndex"] = options.skip;
                            params["lastIndex"] = options.skip + options.take;
                            params["sort"] = options.sort;

                            params["sCalendarTp"] = $("#sCalendarTp").val();
                            params["sCalendarNm"] = $("#sCalendarNm").val();

                            return kendo.stringify(params);
                        } else if (operation !== "read" && options.models) {
                            return kendo.stringify(options.models);
                        }
                    }
                }
                , schema:{
                    model:{
                        id:"calendarId"
                      , fields:{
                            rnum:{type:"number", editable:false}
                          , calendarId:{type:"string", editable:false}
                          , calendarNm:{type:"string", validation:{required:true}}
                          , calendarTp:{type:"string", validation:{required:true}}
                          , hdayCalendarId:{type:"string"}
                          , startDt:{type:"date", validation:{required:true}}
                          , endDt:{type:"date", editable:false, validation:{required:true}}
                        }
                    }
                }
            }
            , selectable:"row"
            , editableOnlyNewExcludeColumns:["langCd", "calendarNm", "calendarTp", "hdayCalendarId", "startDt"]
            , editableOnlyNew:true
            , change:function(e) {
                var selectedVal = this.dataItem(this.select());

                if (selectedVal.calendarTp == "02") {
                    // 휴일 달력
                    $("#workingArea").hide();
                    $("#holidayArea").show();

                    $("#btnHolidayAdd").show();
                    $("#btnHolidayDel").show();
                    $("#btnHolidaySave").show();
                    $("#btnHolidayCancel").show();
                }
                else {
                    // 딜러 달력
                    $("#workingArea").show();
                    $("#holidayArea").show();

                    fnWorkingSetting(selectedVal);

                    $("#btnHolidayAdd").hide();
                    $("#btnHolidayDel").hide();
                    $("#btnHolidaySave").hide();
                    $("#btnHolidayCancel").hide();
                }

                fnHolidayGrid(selectedVal);
            }
            , columns:[
                {title:"", width:80, sortable:false
                    ,attributes:{"class":"ac"}
                    ,template:"<span class='txt_label bg_yellow' onClick='fnTextPopup(\"#=calendarId#\")' style='cursor:pointer'><spring:message code='global.lbl.set.lang' /></span>"
                }
              , {field:"rnum", title:"<spring:message code='global.lbl.no' />" , width:60, sortable:false, attributes:{"class":"ac"}}
              , {field:"calendarId", title:"<spring:message code='cmm.lbl.calendarId' />", width:200}
              , {field:"calendarNm",  title:"<spring:message code='cmm.lbl.calendarNm' />", width:200}
              , {field:"calendarTp",  title:"<spring:message code='cmm.lbl.calendarTp' />", width:150
                  , template:"# if(calendarTpMap[calendarTp] != null) { # #= calendarTpMap[calendarTp].cmmCdNm# # }#"
                      , editor:function(container, options) {
                          $('<input required name="calendarTp" data-bind="value:' + options.field + '"/>')
                          .appendTo(container)
                          .kendoExtDropDownList({
                              autoBind:false
                              ,dataTextField:"cmmCdNm"
                              ,dataValueField:"cmmCd"
                              ,dataSource:arrCalendarTp
                          });
                          $('<span class="k-invalid-msg" data-for="calendarTp"></span>').appendTo(container);
                      }
                  , attributes:{"class":"ac"}}
              , {field:"hdayCalendarId",    title:"<spring:message code='cmm.lbl.hdayCalendarId' />", width:200, attributes:{"class":"ac"}}
              , {field:"startDt",       title:"<spring:message code='cmm.lbl.startDt' />", width:150, attributes:{"class":"ac"}
                  ,format:"{0:<dms:configValue code='dateFormat' />}"
                  ,editor:function(container, options) {
                      $('<input required name="startDt" data-bind="value:' + options.field + '"/>')
                      .appendTo(container)
                      .kendoExtMaskedDatePicker({
                          format:"<dms:configValue code='dateFormat' />"
                          ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
                          ,value:""
                      });
                      $('<span class="k-invalid-msg" data-for="startDt"></span>').appendTo(container);
                  }
              }
              , {field:"endDt",       title:"<spring:message code='cmm.lbl.endDt' />", width:150, attributes:{"class":"ac"}
                  ,format:"{0:<dms:configValue code='dateFormat' />}"
                  ,editor:function(container, options) {
                      $('<input required name="endDt" data-bind="value:' + options.field + '"/>')
                      .appendTo(container)
                      .kendoExtMaskedDatePicker({
                          format:"<dms:configValue code='dateFormat' />"
                          ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
                          ,value:""
                      });
                      $('<span class="k-invalid-msg" data-for="endDt"></span>').appendTo(container);
                  }
              }
              , {title:""}
            ]
        });
    });

    fnHolidayGrid = function(selectedVal) {
        $("#sCalendarId").val(selectedVal.calendarId);

        // 그리드 설정
        $("#holidayGrid").kendoExtGrid({
            dataSource:{
                 transport:{
                    read:{
                        url:"<c:url value='/cmm/sci/calendarInfo/selectHoliday.do' />"
                    }
                    , parameterMap:function(options, operation) {
                        if (operation === "read") {
                            var params = {};

                            params["recordCountPerPage"] = options.pageSize;
                            params["pageIndex"] = options.page;
                            params["firstIndex"] = options.skip;
                            params["lastIndex"] = options.skip + options.take;
                            params["sort"] = options.sort;

                            params["sCalendarTp"] = selectedVal.calendarTp;
                            params["sCalendarId"] = selectedVal.calendarId;

                            return kendo.stringify(params);
                        } else if (operation !== "read" && options.models) {
                            return kendo.stringify(options.models);
                        }
                    }
                }
                , schema:{
                    model:{
                        id:"rnum"
                      , fields:{
                            rnum:{type:"number", editable:false}
                          , calendarId:{type:"string", editable:false}
                          , oldHdayDt:{type:"date"}
                          , newHdayDt:{type:"date"}
                          , hdayInfoTxt:{type:"string", validation:{required:true}}
                        }
                    }
                }
            }
            , multiSelectWithCheckbox:true
            , editableOnlyNew:true
            , editableOnlyNewExcludeColumns:["newHdayDt", "hdayInfoTxt"]
            , change:function(e) {
                var selectedVal = this.dataItem(this.select());

                fnWorkingSetting(selectedVal);
            }
            , columns:[
                {field:"rnum", title:"<spring:message code='global.lbl.no' />", width:60, sortable:false, attributes:{"class":"ac"}}
              , {field:"calendarId", title:"<spring:message code='cmm.lbl.calendarId' />", width:200, attributes:{"class":"ac"}}
              , {field:"newHdayDt", title:"<spring:message code='global.lbl.date' />", width:150//적용종료일자
                 , attributes:{"class":"ac"}
                 , format:"{0:<dms:configValue code='dateFormat' />}"
                 , editor:function (container, options){
                    $('<input id="newHdayDt" required name="newHdayDt" data-bind="value:' + options.field + '"/>')
                    .appendTo(container)
                    .kendoExtMaskedDatePicker({
                        format:"<dms:configValue code='dateFormat' />"
                      , dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
                    });

                    $('<span class="k-invalid-msg" data-for="newHdayDt"></span>').appendTo(container);
                 }
              }

              , {field:"hdayInfoTxt", title:"<spring:message code='cmm.lbl.holidayNm' />", width:150}
              , {title:""}
            ]
        });
    }
</script>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<%//TODO[이인문] 파일업로드 플러그인으로 변경 필요 %>
<script src="<c:url value='/resources/js/resumableFileUpload/resumable.js' />"></script>
<div id="progressWindow" class="resumable-progress">
    <p class="progress-total-txt"><!-- 현재 <span class="current_num">3</span> / 전체 <span class="whole_num">4</span> (<span class="complete_size">10</span>MB / <span class="whole_size">65</span>MB) --></p>
    <table>
        <tr>
            <td width="100%">
                <div class="progress-container">
                    <div class="progress-bar"></div>
                    <div class="progress-txt">00%</div>
                </div>
            </td>
            <td class="progress-pause" nowrap="nowrap">
                <div class="progress-btn">
                    <a href="#" onclick="r.upload(); return(false);" class="progress-resume-link"><img src="<c:url value='/resources/img/btn_resume.png' />" title="Resume upload" /></a>
                    <a href="#" onclick="r.pause(); return(false);" class="progress-pause-link"><img src="<c:url value='/resources/img/btn_pause.png' />" title="Pause upload" /></a>
                </div>
            </td>
        </tr>
    </table>
    <ul class="resumable-list"></ul>
</div>

<div id="resizableContainer">
    <section class="group">

        <!-- 조회 조건 타이틀 시작 -->
        <div class="header_area">
            <h1 class="title_basic"><spring:message code="cmm.title.intMail" /></h1>
            <div class="btn_right">
			<dms:access viewId="VIEW-D-11383" hasPermission="${dms:getPermissionMask('READ')}">
                <button class="btn_m btn_search" id="btnSearch"><spring:message code="global.btn.search" /></button>
			</dms:access>
               <!-- <button class="btn_m btn_save" id="btnSave"><spring:message code="global.btn.save" /></button>-->
            <dms:access viewId="VIEW-D-11384" hasPermission="${dms:getPermissionMask('READ')}">
                <button class="btn_m btn_add" id="btnAdd"><spring:message code="global.btn.createMail" /></button>
            </dms:access>
            <dms:access viewId="VIEW-D-11385" hasPermission="${dms:getPermissionMask('READ')}">
                <button class="btn_m btn_del" id="btnDel"><spring:message code="global.btn.del" /></button>
            </dms:access>
            </div>
        </div>
        <!-- 조회 조건 타이틀 종료 -->

        <!-- 조회 조건 시작 -->
        <div class="table_form form_width_50per" role="search" data-btnid="btnSearch">
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
                        <th scope="row"><spring:message code='global.lbl.title' /><!-- 제목 --></th>
                        <td>
                            <input type="hidden" id="sIntMailId" name="sIntMailId" value="" />

                            <input type="text" id="sIntMailTitleNm" name="sIntMailTitleNm" class="form_input" />
                        </td>
                        <th scope="row"><spring:message code="global.lbl.sendTime" /><!-- 발송일시 --></th>
                        <td>
                            <div class="form_float">
                                <div class="date_left">
                                    <input id="sStartResvDt" name="sStartResvDt" class="form_datepicker" />
                                    <span class="txt_from">~</span>
                                </div>
                                <div class="date_right">
                                    <input id="sEndResvDt" name="sEndResvDt" class="form_datepicker" />
                                </div>
                            </div>
                        </td>
                        <th scope="row"></th>
                        <td></td>
                    </tr>
                </tbody>
            </table>
        </div>
        <!-- 조회 조건 종료 -->

        <!-- 그리드 시작 -->
        <div class="table_grid mt10">
            <div id="grid" class="resizable_grid"></div>
        </div>
    </section>
    <!-- 그리드 종료 -->
    <section id ="sendMailPopup" class="pop_wrap">
        <div id="contContainer" style="display:none;">
            <div class="header_area">
                <h2 class="title_basic"><spring:message code="cmm.title.createIntMail" /></h2>
                <div class="btn_right">
                <dms:access viewId="VIEW-D-11386" hasPermission="${dms:getPermissionMask('READ')}">
                    <button type="button" class="btn_s" id="btnDetailSave"><spring:message code="global.btn.sendMail" /></button>
                </dms:access>
                <!--<button type="button" class="btn_s" id="btnDetailDel"><spring:message code="global.btn.del" /></button>-->
                <dms:access viewId="VIEW-D-11387" hasPermission="${dms:getPermissionMask('READ')}">
                    <button type="button" class="btn_s" id="btnDetailCancel"><spring:message code="global.btn.cancel" /></button>
                </dms:access>
                <dms:access viewId="VIEW-D-11388" hasPermission="${dms:getPermissionMask('READ')}">
                    <span class="btn_file" id="btnFileSel"><spring:message code="global.lbl.FindFile" /><!-- 파일찾기 --></span>
                </dms:access>
                <dms:access viewId="VIEW-D-11389" hasPermission="${dms:getPermissionMask('READ')}">
                    <button type="button" class="btn_s" id="btnFileDel"><spring:message code="global.btn.fileDelete" /><!-- 파일삭제 --></button>
                </dms:access>

                </div>
            </div>

            <div class="table_form" id="contContainer">
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
                            <col style="width:10%;">
                            <col>
                        </colgroup>
                        <tbody>
                            <tr>
                                <th scope="row"><spring:message code="global.lbl.bookingSent" /><!-- 예약 발송 --></th>
                                <td>
                                    <input type="hidden" id="resvSendYn" name="resvSendYn" />
                                    <input type="checkbox" id="resvSendYnFlag" name="resvSendYnFlag" class="form_check" />
                                </td>
                                <th id="thSendRevDt" scope="row"><spring:message code="global.lbl.bookingSentTime" /><!-- 예약 발송 일시 --></th>
                                <td id="tdSendRevDt">
                                    <input id="resvDt" name="resvDt" value="" class="form_datetimepicker">
                                </td>
                                <td></td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="global.lbl.title" /><!-- 제목 --></th>
                                <td colspan="13">
                                    <input type="text" id="intMailTitleNm" name="intMailTitleNm" class="form_input" />
                                </td>
                                <td></td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="global.lbl.cont" /><!-- 내용 --></th>
                                <td colspan="13">
                                    <textarea id="intMailCont" name="intMailCont" class="form_textarea" style="height:150px;"></textarea>
                                </td>
                                <td></td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="global.lbl.attachedFile" /><!-- 첨부파일 --></th>
                                <td colspan="13">
                                    <div class="table_grid">
                                        <input type="hidden" id="fileDocNo" name="fileDocNo" value="" />
                                        <div id="fileGrid"></div>
                                    </div>
                                </td>
                                <td></td>
                            </tr>
                        </tbody>
                    </table>
                </form>
            </div>
        </div>

        <div id="receiverContainer" style="display:none;">
            <div class="header_area">
                <h3 class="title_basic"><spring:message code="global.title.receiverSet" /><!-- 수신자 설정 --></h3>
            </div>

            <div class="table_form">
                <form id="dealerSearchForm">
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
                                <th scope="row"><spring:message code="global.lbl.area" /> <!-- 지역 --></th>
                                <td>
                                    <input type="text" id="sDistCd" name="sDistCd" class="form_comboBox" />
                                </td>
                                <th scope="row"><spring:message code="global.lbl.dealer" /><!-- 딜러 --></th>
                                <td>
                                    <input type="text" id="sDlrCd" name="sDlrCd" class="form_comboBox" disabled="disabled" />
                                </td>
                                <th scope="row"></th>
                                <td></td>
                                <th scope="row"></th>
                                <td></td>
                            </tr>
                            <tr>
                            </tr>
                        </tbody>
                    </table>
                </form>
            </div>

            <section class="group">
                <!-- // 탭 시작 -->
                <div id="tabstrip" class="tab_area">
                    <ul>
                        <li id ="tabTargetResource" class="k-state-active"><spring:message code="cmm.title.role" /><!-- 역할 --></li>
                        <li id ="tabTargetUser"><spring:message code="cmm.title.user" /><!-- 사용자 --></li>
                    </ul>
                    <!--역할 탭 영역 -->
                    <div class="mt0">
                        <div class="header_area">
                            <div class="btn_right">
                            <dms:access viewId="VIEW-D-11390" hasPermission="${dms:getPermissionMask('READ')}">
                                <button type="button" class="btn_s" id="btnRoleAdd"><spring:message code="global.btn.add" /></button>
                            </dms:access>
                            <dms:access viewId="VIEW-D-11391" hasPermission="${dms:getPermissionMask('READ')}">
                                <button type="button" class="btn_s" id="btnRoleDel"><spring:message code="global.btn.del" /></button>
                            </dms:access>
                            </div>
                        </div>
                        <div class="table_grid">
                            <!-- 역할 그리드 -->
                            <div id="roleGrid" ></div>
                            <!-- 역할 그리드 -->
                        </div>
                    </div>
                    <!--사용자 탭 영역 -->
                    <div class="mt0">
                        <div class="header_area">
                            <div class="btn_right">
                            <dms:access viewId="VIEW-D-11392" hasPermission="${dms:getPermissionMask('READ')}">
                                <button type="button" class="btn_s" id="btnUserAdd"><spring:message code="global.btn.add" /></button>
                            </dms:access>
                            <dms:access viewId="VIEW-D-11393" hasPermission="${dms:getPermissionMask('READ')}">
                                <button type="button" class="btn_s" id="btnUserDel"><spring:message code="global.btn.del" /></button>
                            </dms:access>                            </div>
                        </div>
                        <div class="table_grid">
                            <!-- 사용자 그리드 -->
                            <div id="userGrid" ></div>
                            <!-- 사용자 그리드 -->
                        </div>
                    </div>
                </div>
                <!-- // 탭 종료 -->
            </section>
        </div>
    </section>


<script type="text/javascript">
    //등록 시작일
    $("#sStartResvDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });

    // 등록 종료일
    $("#sEndResvDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });

    $(".form_datetimepicker").kendoDateTimePicker({
        interval:30
        ,format:"<dms:configValue code='dateFormat' /> HH:mm"
    });

    // 탭
    $("#tabstrip").kendoExtTabStrip({
        animation:false
    });

    // 지역 List
    var arrInternalMailArea = [{"distCd":"", "distNm":""}];
    <c:forEach var="obj" items="${internalMailArea}">
    arrInternalMailArea.push({
        "distCd":"${obj.distCd}"
        ,"distNm":"${obj.distNm}"
    });
    </c:forEach>

  //메일작성 입력값 설정
    function initForm(id) {
        var datas = id;

        //신규
        if(datas == null || datas == ""){
            $("#grid").data("kendoExtGrid").clearSelection();
            $("#fileGrid").data("kendoExtGrid").dataSource.data([]);

            $("#resvSendYnFlag").prop("checked", false);
            $("#resvSendYnFlag").prop("disabled", false);

            $("#resvDt").prop("disabled", false);
            $("#resvDt").val("");
            $("#thSendRevDt").hide();
            $("#tdSendRevDt").hide();

            $("#intMailTitleNm").prop("disabled", false);
            $("#intMailTitleNm").val("");
            $("#intMailCont").prop("disabled", false);
            $("#intMailCont").val("");

            $("#btnDetailSave").show();
            $("#btnDetailCancel").show();
            $("#btnDetailDel").hide();
            $("#btnFileSel").show();
            $("#btnFileDel").show();

            $("#btnRoleAdd").show();
            $("#btnRoleDel").show();
            $("#btnUserAdd").show();
            $("#btnUserDel").show();

            $("#contContainer").show();
            $("#receiverContainer").show();

            $("#fileGrid").data("kendoExtGrid").dataSource.data([]);
            $("#roleGrid").data("kendoExtGrid").dataSource.data([]);
            $("#userGrid").data("kendoExtGrid").dataSource.data([]);
        }

        else{
            var grid = $("#grid").data("kendoExtGrid");
            if (grid.select().length > 0) {
                var dataItem = grid.dataItem(grid.select());
                $("#sIntMailId").val(dataItem.intMailId);
                $.ajax({
                    url:"<c:url value='/cmm/mail/internalMail/selectInternalMailByKey.do' />"
                  ,data:JSON.stringify({"sIntMailId":dataItem.intMailId})
                  ,type:'POST'
                  ,dataType:'json'
                  ,contentType:'application/json'
                  ,error:function(jqXHR,status,error) {
                      dms.notification.error(jqXHR.responseJSON.errors);
                  }
                  ,success:function(jqXHR, textStatus) {
                      if (jqXHR.resvSendYn == "Y") {
                          $("#resvSendYn").val("Y");
                          $("#resvSendYnFlag").prop("checked", true);
                          $("#resvDt").val(jqXHR.resvDt.substring(0, 4) + "-" + jqXHR.resvDt.substring(4, 6) + "-" + jqXHR.resvDt.substring(6, 8) + " " + jqXHR.resvHm);
                          $("#thSendRevDt").show();
                          $("#tdSendRevDt").show();
                      }
                      else {
                          $("#resvSendYn").val("N");
                          $("#resvSendYnFlag").prop("checked", true);
                          $("#resvDt").val("");
                          $("#thSendRevDt").hide();
                          $("#tdSendRevDt").hide();
                      }

                      $("#resvSendYnFlag").prop("disabled", true);
                      $("#resvDt").prop("disabled", true);

                      $("#intMailTitleNm").val(jqXHR.intMailTitleNm);
                      $("#intMailCont").val(jqXHR.intMailCont);

                      $("#intMailTitleNm").prop("disabled", true);
                      $("#intMailCont").prop("disabled", true);

                      $("#fileDocNo").val(jqXHR.fileDocNo);

                      $("#btnDetailSave").hide();
                      $("#btnDetailDel").show();
                      $("#btnFileSel").hide();
                      $("#btnFileDel").hide();
                      $("#btnRoleAdd").hide();
                      $("#btnRoleDel").hide();
                      $("#btnUserAdd").hide();
                      $("#btnUserDel").hide();

                      $("#sDistCd").data("kendoExtDropDownList").value("");

                      arrInternalMailDealer = [{"dlrCd":"", "dlrNm":""}];

                      // Dealer DropDownList
                      $("#sDlrCd").kendoExtDropDownList({
                          dataTextField:"dlrNm"
                          ,dataValueField:"dlrCd"
                          ,dataSource:arrInternalMailDealer
                          ,enable:false
                      });

                      $("#fileGrid").data("kendoExtGrid").dataSource.read();
                      $("#roleGrid").data("kendoExtGrid").dataSource.read();
                      $("#userGrid").data("kendoExtGrid").dataSource.read();

                      $("#contContainer").show();
                      $("#receiverContainer").show();
                    }
                });
            }
        }
  }

  //Issue 정보 수정화면 팝업 화면을 오픈한다.
    function openEditPopup(intMaidId){
        initForm(intMaidId);
        $("#sendMailPopup").data("kendoWindow").center().open();
    }

    // Dealer List
    var arrInternalMailDealer = [{"dlrCd":"", "dlrNm":""}];

    // Dealer DropDownList
    $("#sDlrCd").kendoExtDropDownList({
        dataTextField:"dlrNm"
        ,dataValueField:"dlrCd"
        ,dataSource:arrInternalMailDealer
        ,enable:true
    });

    var arrInternalMailAreaMap = dms.data.arrayToMap(arrInternalMailArea, function(obj){ return obj.distCd; });

    fnDealerList = function() {
        var searchData = "";

        searchData = $("#dealerSearchForm").serializeObject();

        $.ajax({
            url:"<c:url value='/cmm/mail/internalMail/selectInternalMailDealerByCondition.do' />"
            ,data:JSON.stringify(searchData)
            ,type:'POST'
            ,dataType:'json'
            ,contentType:'application/json'
            ,error:function(jqXHR,status,error) {
                dms.notification.error(jqXHR.responseJSON.errors);
            }
            ,beforeSend:function() {
                var dealerDropDownlist = $("#sDlrCd").data("kendoExtDropDownList");
                dealerDropDownlist.enable(false);
            }
            ,success:function(jqXHR, textStatus) {
                arrInternalMailDealer = [{"dlrCd":"", "dlrNm":""}];

                $.each(jqXHR, function(index, value) {
                    arrInternalMailDealer.push({
                        "dlrCd":value.dlrCd
                        ,"dlrNm":value.dlrNm
                    });
                });

                // Dealer DropDownList
                $("#sDlrCd").kendoExtDropDownList({
                    dataTextField:"dlrNm"
                    ,dataValueField:"dlrCd"
                    ,dataSource:arrInternalMailDealer
                    ,enable:true
                });
            }
            ,complete:function() {
                var dealerDropDownlist = $("#sDlrCd").data("kendoExtDropDownList");
                dealerDropDownlist.enable(true);
            }
        });
    }

    // 지역 DropDownList
    $("#sDistCd").kendoExtDropDownList({
        dataTextField:"distNm"
        ,dataValueField:"distCd"
        ,dataSource:arrInternalMailArea
        ,index:0
        ,change:fnDealerList
    });

    // Role 선택 팝업
    var rolePopupWin;
    // User 선택 팝업
    var userPopupWin;

    fnRolePopup = function() {
        rolePopupWin = dms.window.popup({
           windowsId:"receiveRolePopupWin"
         , title:"<spring:message code='cmm.title.role' /> Popup"
         , content:{
              url:"<c:url value='/cmm/mail/internalMail/selectInternalMailRolePopup.do' />"
            , data:{
                 "autoBind":false
               , "callbackFunc":function(roleId, roleNm) {
                   $('#roleGrid').data('kendoExtGrid').dataSource.insert(0, {
                       "receiveSummId":""
                     , "distCd":($("#sDistCd").data("kendoExtDropDownList").value() == "" ? "":$("#sDistCd").data("kendoExtDropDownList").value())
                     , "distNm":($("#sDistCd").data("kendoExtDropDownList").text() == "" ? "<spring:message code='global.lbl.allArea' />":$("#sDistCd").data("kendoExtDropDownList").text())
                     , "dlrCd":($("#sDlrCd").data("kendoExtDropDownList").value() == "" ? "":$("#sDlrCd").data("kendoExtDropDownList").value())
                     , "dlrNm":($("#sDlrCd").data("kendoExtDropDownList").text() == "" ? "<spring:message code='global.lbl.allDealer' />":$("#sDlrCd").data("kendoExtDropDownList").text())
                     , "refTp":"R"
                     , "refId":roleId
                     , "roleNm":roleNm
                   });
                 }
              }
           }
        });
    }



    fnUserPopup = function(distCd, dlrCd) {
        userPopupWin = dms.window.popup({
           windowsId:"receiveUserPopupWin"
         , title:"<spring:message code='cmm.title.user' /> Popup"
         , content:{
              url:"<c:url value='/cmm/mail/internalMail/selectInternalMailUserPopup.do' />"
            , data:{
                 "autoBind":false
               , "distCd":distCd
               , "dlrCd":dlrCd
               , "callbackFunc":function(usrId, usrNm) {
                   $('#userGrid').data('kendoExtGrid').dataSource.insert(0, {
                       "receiveSummId":""
                     , "distCd":$("#sDistCd").data("kendoExtDropDownList").value()
                     , "distNm":$("#sDistCd").data("kendoExtDropDownList").text()
                     , "dlrCd":$("#sDlrCd").data("kendoExtDropDownList").value()
                     , "dlrNm":$("#sDlrCd").data("kendoExtDropDownList").text()
                     , "refTp":"U"
                     , "refId":usrId
                     , "usrNm":usrNm
                   });
                 }
              }
           }
        });
    }

    $(document).ready(function() {
        $("#thSendRevDt").hide();
        $("#tdSendRevDt").hide();

        $("#resvSendYnFlag").bind("click", function() {
            var $this = $(this);

            if ($this.is(":checked")) {
                $("#thSendRevDt").show();
                $("#tdSendRevDt").show();
            }
            else {
                $("#thSendRevDt").hide();
                $("#tdSendRevDt").hide();
            }
        });

        // 버튼 - 조회
        $("#btnSearch").kendoButton({
            click:function(e) {
                $('#grid').data('kendoExtGrid').dataSource.page(1);

                $("#contContainer").hide();
                $("#receiverContainer").hide();
            }
        });

        // 버튼 - 추가
        $("#btnAdd").kendoButton({
            click:function(e) {
                initForm();
                $("#sendMailPopup").data("kendoWindow").center().open();
            }
        });

        //Issue 등록/수정 팝업
        $("#sendMailPopup").kendoWindow({
            animation:false
            ,draggable:true
            ,pinned:true
            ,modal:false
            ,resizable:false
            ,visible:false
            ,title:"<spring:message code='cmm.title.changeRequestBoardMng' />"
            ,width:"950px"
            ,height:"700px"
        }).data("kendoWindow");


        // 버튼 - 저장
        /*$("#btnSave").kendoButton({
            click:function(e) {
                var grid = $("#grid").data("kendoExtGrid");
                var saveData = grid.getCUDData("insertList", "updateList", "deleteList");

                $.ajax({
                    url:"<c:url value='/cmm/mail/internalMail/multiDeleteInternalMail.do' />"
                  , data:JSON.stringify(saveData)
                  , type:'POST'
                  , dataType:'json'
                  , async:false
                  , contentType:'application/json'
                  , error:function(jqXHR,status,error) {
                        dms.notification.error(jqXHR.responseJSON.errors);
                    }
                  , success:function(jqXHR, textStatus) {
                        grid.dataSource._destroyed = [];
                        grid.dataSource.page(1);

                        $("#contContainer").hide();
                        $("#receiverContainer").hide();

                        //정상적으로 반영 되었습니다.
                        dms.notification.success("<spring:message code='global.info.success'/>");
                    }
                });
            }
        });
        */

        // 버튼 - 삭제
        $("#btnDel").kendoButton({
            click:function(e) {
                var grid = $("#grid").data("kendoExtGrid");
               // var saveData = grid.getCUDData("insertList", "updateList", "deleteList");
               var saveData = grid.getCUDData("insertList", "updateList", "deleteList");
               var rows = grid.select();
               if (rows.length < 1) {
                   //목록을 선택하여 주십시오.
                   dms.notification.info("<spring:message code='global.info.required.select'/>");
                   return;
               }

               rows.each(function(index, row) {
                   grid.removeRow(row);
               }
               )




                $.ajax({
                    url:"<c:url value='/cmm/mail/internalMail/multiDeleteInternalMail.do' />"
                  , data:JSON.stringify(saveData)
                  , type:'POST'
                  , dataType:'json'
                  , async:false
                  , contentType:'application/json'
                  , error:function(jqXHR,status,error) {
                        dms.notification.error(jqXHR.responseJSON.errors);
                    }
                  , success:function(jqXHR, textStatus) {
                        grid.dataSource._destroyed = [];
                        grid.dataSource.page(1);

                        $("#contContainer").hide();
                        $("#receiverContainer").hide();

                        //정상적으로 반영 되었습니다.
                        dms.notification.success("<spring:message code='global.info.success'/>");
                  }
                });
            }
        });

        // 버튼 - 메일 발송
        $("#btnDetailSave").kendoButton({
            click:function(e) {
                var formSaveData = "";
                var json = "";
                var grid = $("#grid").data("kendoExtGrid");
                var roleGrid = $("#roleGrid").data("kendoExtGrid");
                var userGrid = $("#userGrid").data("kendoExtGrid");

                if ($("#resvSendYnFlag").is(":checked")) {
                    $("#resvSendYn").val("Y");
                }
                else {
                    $("#resvSendYn").val("N");
                    $("#resvDt").val("");
                }

                saveData = $("#saveForm").serializeObject();
                var roleSaveData = roleGrid.getCUDData("insertList", "updateList", "deleteList");
                var userSaveData = userGrid.getCUDData("insertList", "updateList", "deleteList");

                var param = $.extend(
                    {"internalMailVO":saveData}
                    ,{"internalMailRoleVO":roleSaveData}
                    ,{"internalMailUserVO":userSaveData}
                );

                if (roleGrid.cudDataLength == 0 && userGrid.cudDataLength == 0) {
                    // 변경된 정보가 없습니다.
                    dms.notification.info("<spring:message code='global.info.required.change'/>");
                    return;
                }

                $.ajax({
                    url:"<c:url value='/cmm/mail/internalMail/multiInternalMail.do' />"
                  , data:JSON.stringify(param)
                  , type:'POST'
                  , dataType:'json'
                  , async:false
                  , contentType:'application/json'
                  , error:function(jqXHR,status,error) {
                        dms.notification.error(jqXHR.responseJSON.errors);
                    }
                  , success:function(jqXHR, textStatus) {
                        grid.dataSource._destroyed = [];
                        grid.dataSource.page(1);

                        $("#contContainer").hide();
                        $("#receiverContainer").hide();

                        //정상적으로 반영 되었습니다.
                        dms.notification.success("<spring:message code='global.info.success'/>");
                       //그리드 릴로드
                        $("#grid").data("kendoExtGrid").dataSource.page(1);
                        // 팝업 닫기
                        $("#sendMailPopup").data("kendoWindow").close();
                    }
                });

            }
        });

        /* 버튼 - 팝업삭제
        $("#btnDetailDel").kendoButton({
            click:function(e) {
                //var grid = $("#grid").data("kendoExtGrid");
                //var searchData = $("#searchForm").serializeObject();
               var fileGrid = $("#fileGrid").data("kendoExtGrid");
               var rows = fileGrid.select();
               var deleteList = [];

                $.ajax({
                    url:"<c:url value='/cmm/mail/internalMail/deleteInternalMail.do' />"
                  , data:JSON.stringify({"intMailId":$("#sIntMailId").val()})
                  , type:'POST'
                  , dataType:'json'
                  , async:false
                  , contentType:'application/json'
                  , error:function(jqXHR,status,error) {
                        dms.notification.error(jqXHR.responseJSON.errors);
                    }
                  , success:function(jqXHR, textStatus) {
                        grid.dataSource._destroyed = [];
                        grid.dataSource.page(1);

                        $("#contContainer").hide();
                        $("#receiverContainer").hide();

                        //정상적으로 반영 되었습니다.
                        dms.notification.success("<spring:message code='global.info.success'/>");
                     // 팝업 닫기
                        $("#sendMailPopup").data("kendoWindow").close();
                    }
                });
            }
        });
        */

        // 버튼 - 취소
        $("#btnDetailCancel").kendoButton({
            click:function(e) {
                $("#contContainer").hide();
                $("#receiverContainer").hide();

                $('#grid').data('kendoExtGrid').clearSelection();
                $("#fileGrid").data("kendoExtGrid").dataSource.data([]);
                $("#roleGrid").data("kendoExtGrid").dataSource.data([]);
                $("#userGrid").data("kendoExtGrid").dataSource.data([]);
                $("#sendMailPopup").data("kendoWindow").close();
            }
        });

        // 버튼 - 첨부파일 삭제
        $("#btnFileDel").kendoButton({
           click:function(e) {
               var fileGrid = $("#fileGrid").data("kendoExtGrid");
               var rows = fileGrid.select();
               var deleteList = [];

               if (rows.length < 1) {
                   //목록을 선택하여 주십시오.
                   dms.notification.info("<spring:message code='global.info.required.select'/>");
                   return;
               }

               rows.each(function(index, row) {
                   var dataItem = fileGrid.dataItem(row);
                   deleteList.push({"fileDocNo":dataItem.fileDocNo, "fileNo":dataItem.fileNo});
               });

               $.ajax({
                   url:"<c:url value='/cmm/sci/fileUpload/deleteFiles.do' />"
                   ,data:JSON.stringify(deleteList)
                   ,type:'POST'
                   ,dataType:'json'
                   ,contentType:'application/json'
                   ,error:function(jqXHR,status,error) {
                       dms.notification.error(jqXHR.responseJSON.errors);
                   }
                   ,success:function(jqXHR, textStatus) {
                       //정상적으로 반영 되었습니다.
                       dms.notification.success("<spring:message code='global.info.success'/>");

                       $("#fileGrid").data("kendoExtGrid").dataSource.read();
                   }
               });
           }
        });

      //그리드 더블클릭시 Issue 정보 수정화면 팝업을 오픈한다.
        $("#grid").on("dblclick", "tr.k-state-selected", function(e){
            var grid = $(e.delegateTarget).data("kendoExtGrid");
            if(grid.select().length > 0){
                openEditPopup(grid.dataItem(grid.select()).intMailId);
            }
        });

        // 게시물 그리드
        $("#grid").kendoExtGrid({
            dataSource:{
                 transport:{
                    read:{
                        url:"<c:url value='/cmm/mail/internalMail/selectInternalMailByCondition.do' />"
                    }
                    , parameterMap:function(options, operation) {
                        if (operation === "read") {
                            var params = {};

                            params["recordCountPerPage"] = options.pageSize;
                            params["pageIndex"] = options.page;
                            params["firstIndex"] = options.skip;
                            params["lastIndex"] = options.skip + options.take;
                            params["sort"] = options.sort;

                            params["sIntMailTitleNm"] = $("#sIntMailTitleNm").val();
                            params["sStartResvDt"] = $("#sStartResvDt").val();
                            params["sEndResvDt"] = $("#sEndResvDt").val();

                            return kendo.stringify(params);
                        } else if (operation !== "read" && options.models) {
                            return kendo.stringify(options.models);
                        }
                    }
                 }
				, schema:{
                    model:{
                            id:"intMailId"
                          , fields:{
                                    rnum:{type:"string"}
                                  , intMailId:{type:"string"}
                                  , intMailTitleNm:{type:"string"}
                                  , fileYn:{type:"string"}
                                  , fileYn:{type:"string"}
                                  , usrNm:{type:"string"}
                                  , regDt:{type:"string"}
                        }
                    }
                }
			}
            //,height:150
            ,selectable:"row"
            ,editable:false
            ,multiSelectWithCheckbox:false
            ,columns:[
              {field:"rnum", title:"<spring:message code='global.lbl.no' />", width:60
                  ,attributes:{"class":"ac"}
              }
              ,{field:"intMailId", title:"<spring:message code='cmm.lbl.intMail' />ID", width:150
                  ,attributes:{"class":"ac"}
              }
              ,{field:"intMailTitleNm", title:"<spring:message code='global.lbl.title' />", width:300}
              ,{field:"fileYn", title:"<spring:message code='global.lbl.attachYn' />", width:120
                  ,attributes:{"class":"ac"}
              }
              ,{field:"fileYn", title:"<spring:message code='global.lbl.recipientsSummary' />", width:120
                  ,attributes:{"class":"ac"}
              }
              ,{field:"usrNm", title:"<spring:message code='global.lbl.mailer' />", width:120
                  ,attributes:{"class":"ac"}
              }
              ,{field:"regDt", title:"<spring:message code='global.lbl.sendTime' />", width:150
                  ,attributes:{"class":"ac"}
                  ,format:"{0:<dms:configValue code='dateTimeFormat' />}"
              }
              ,{title:""}
            ]
        });

        //첨부파일 그리드
        $("#fileGrid").kendoExtGrid({
            dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/cmm/sci/fileUpload/selectFiles.do' />"
                    }
                    ,parameterMap:function(options, operation) {
                        if (operation === "read") {
                            var params = {};
                            params["sFileDocNo"] = $("#fileDocNo").val();

                            return kendo.stringify(params);

                        }else if (operation !== "read" && options.models) {
                            return kendo.stringify(options.models);
                        }
                    }
                }
                ,schema:{
                    model:{
                        fields:{
                            fileDocNo:{type:"string"}
                            ,fileNo:{type:"number"}
                            ,fileNm:{type:"string"}
                            ,fileSize:{type:"number"}
                        }
                    }
                }
            }
           ,autoBind:false
           ,editable:false
           ,height:150
           ,navigatable:false
           ,pageable:false
           ,sortable:false
           ,multiSelectWithCheckbox:true

           ,columns:[
              {field:"fileNm", title:"<spring:message code='global.lbl.fileNm' />"
                  ,template:"<span style=\"text-decoration:underline;cursor:pointer;\" onclick=\"dms.fileManager.download(\"#=fileDocNo#\",\"#=fileNo#\")\">#=fileNm#</span>"
              }
              ,{field:"fileSize", title:"<spring:message code='global.lbl.fileSize' />", width:150    // 파일크기
                  ,attributes:{"class":"ac"}
                  ,template:"#= dms.string.formatFileSize(fileSize) #"
              }
           ]
       });
       // 파일 그리드 종료 //

        //================================ 파일 업무로 관련 스크립트
        var r = new Resumable({
            target:"<c:url value='/cmm/sci/fileUpload/selectResumableFileUpload.do'/>"
            ,chunkSize:1 * 1024 * 1024
            ,simultaneousUploads:4
            ,testChunks:true
            ,throttleProgressCallbacks:1
            ,method:"octet"
        });

        r.assignBrowse($('#btnFileSel')[0]);

        //파일추가 이벤트
        r.on('fileAdded', function(file) {

            $("#progressWindow").kendoWindow({
                width:"600px"
                ,height:"300px"
                ,title:"<spring:message code='global.lbl.fileSend'/>"     // 파일전송
                ,animation:false
                ,draggable:false
                ,visible:false
                ,resizable:false
                ,modal:true
            }).data("kendoWindow").center().open();


            $('.resumable-progress, .resumable-list').show();
            $('.resumable-progress .progress-resume-link').hide();
            $('.resumable-progress .progress-pause-link').show();

            //파일목록 출력
            $('.resumable-list').append('<li class="resumable-file-'+file.uniqueIdentifier+'"><div class="progress-file-name"><div class="resumable-file-name"></div><div class="progress-file-size"><!--<span class="progress-complete-size">00</span>MB/<span class="progress-whole-size">00</span>MB</div>--></div><div class="file-progress-container"><div class="resumable-file-progress"></div><div class="resumable-file-txt"></div></div>');
            $('.resumable-file-' + file.uniqueIdentifier + ' .resumable-file-name').html(file.fileName);

            //업로드 시작
            r.upload();

        });
        r.on('pause', function() {
            $('.resumable-progress .progress-resume-link').show();
            $('.resumable-progress .progress-pause-link').hide();
        });
        r.on('uploadStart', function() {

            var _that = this;

            if (_that.opt["query"] == null) {
                 _that.opt["query"] = {};
            }

            if (dms.string.isEmpty($("#fileDocNo").val())) {
                $.ajax({
                    url:"<c:url value='/cmm/sci/fileUpload/selectFileDocNo.do' />",
                    dataType:"json",
                    type:"get",
                    async:false,
                    cache:false,
                    success:function(id) {
                        _that.opt["query"]["resumableSessionId"] = id;
                        $("#fileDocNo").val(id);
                    }
                });
            } else {
                _that.opt["query"]["resumableSessionId"] = $("#fileDocNo").val();
            }

            $('.resumable-progress .progress-resume-link').hide();
            $('.resumable-progress .progress-pause-link').show();
        });
        r.on('complete', function() {

            var _that = this;

            $('.resumable-progress .progress-resume-link, .resumable-progress .progress-pause-link').hide();

            $("#progressWindow").data("kendoWindow").close();
            r.files = [];
            $(".resumable-list").html("");
        });
        r.on('fileSuccess', function(file, message) {

            var result = JSON.parse(message);
            if(result.status === "finished") {
                $("#fileGrid").data("kendoExtGrid").dataSource.insert({
                    fileDocNo:result.fileDocNo
                    ,fileNo:result.fileNo
                    ,fileNm:result.fileNm
                    ,fileSize:result.fileSize
                });
            }
        });
        r.on('fileError', function(file, message) {
            $('.resumable-file-' + file.uniqueIdentifier + ' .resumable-file-txt').html('(file could not be uploaded:' + message + ')');
        });
        r.on('fileProgress', function(file) {
            var fileProgress = 0;

            if (file instanceof ResumableChunk) {
                fileProgress = file.fileObj.progress();
            } else {
                fileProgress = file.progress();
            }

            $('.resumable-file-' + file.uniqueIdentifier + ' .resumable-file-txt').html(Math.min(Math.floor(fileProgress * 100), 100) + '%');
            $('.resumable-file-' + file.uniqueIdentifier + ' .resumable-file-progress').css({width:Math.min(Math.floor(fileProgress * 100), 100) + '%'});
            $('.progress-bar').css({width:Math.min(Math.floor(r.progress() * 100), 100)+ '%'});
        });
        //================================

        if($("#flag").val()=="U") {
            var grid = $("#fileGrid").data("kendoExtGrid");
            grid.dataSource._destroyed = [];
            grid.dataSource.read();
        }

        // 버튼 - 삭제 - Role Grid
        $("#btnRoleDel").kendoButton({
            click:function(e) {
                var grid = $("#roleGrid").data("kendoExtGrid");
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

        // 버튼 - 삭제 - User Grid
        $("#btnUserDel").kendoButton({
            click:function(e) {
                var grid = $("#userGrid").data("kendoExtGrid");
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

        // 버튼 - 추가 - Role Grid
        $("#btnRoleAdd").kendoButton({
            click:function(e) {
                fnRolePopup();
            }
        });

        // 버튼 - 추가 - User Grid
        $("#btnUserAdd").kendoButton({
            click:function(e) {
                if ($("#sDistCd").data("kendoExtDropDownList").value() != "" && $("#sDlrCd").data("kendoExtDropDownList").value() != "") {
                    fnUserPopup($("#sDistCd").data("kendoExtDropDownList").value(), $("#sDlrCd").data("kendoExtDropDownList").value());
                }
                else {
                    dms.notification.info("<spring:message code='cmm.info.selectRegionDealersMsg' />");
                }
            }
        });

        // Role 그리드
        $("#roleGrid").kendoExtGrid({
            dataSource:{
                 transport:{
                    read:{
                        url:"<c:url value='/cmm/mail/internalMail/selectInternalMailReceiverRoleByCondition.do' />"
                    }
                    , parameterMap:function(options, operation) {
                        if (operation === "read") {
                            var params = {};

                            params["sIntMailId"] = $("#sIntMailId").val();

                            return kendo.stringify(params);
                        } else if (operation !== "read" && options.models) {
                            return kendo.stringify(options.models);
                        }
                    }
                }
                , schema:{
                    model:{
                        id:"receiveSummId"
                      , fields:{
                            receiveSummId:{type:"string"}
                          , distCd:{type:"string"}
                          , distNm:{type:"string"}
                          , dlrCd:{type:"string"}
                          , dlrNm:{type:"string"}
                          , refTp:{type:"string"}
                          , refId:{type:"string"}
                          , roleNm:{type:"string"}
                        }
                    }
                }
            }
            ,height:150
            ,selectable:"row"
            ,editable:false
            ,navigatable:false
            ,pageable:false
            ,sortable:false
            ,multiSelectWithCheckbox:true
            ,columns:[
              {field:"distNm", title:"<spring:message code='global.lbl.area' />", width:150
                  ,template:function (data) {
                      var message = "";

                      if (data.distCd == null || data.distCd == '') {
                          message = "<spring:message code='global.lbl.allArea' />";
                      }
                      else {
                          message = data.distNm;
                      }

                      return message;
                  }
                  ,attributes:{"class":"ac"}
              }
              ,{field:"dlrNm", title:"<spring:message code='global.lbl.dealer' />", width:150
                  ,template:function (data) {
                      var message = "";

                      if (data.dlrCd == null || data.dlrCd == '') {
                          message = "<spring:message code='global.lbl.allDealer' />";
                      }
                      else {
                          message = data.dlrNm;
                      }

                      return message;
                  }
                  ,attributes:{"class":"ac"}
              }
              ,{field:"refId", title:"<spring:message code='global.lbl.roleId' />", width:200
                  ,attributes:{"class":"ac"}
              }
              ,{field:"roleNm", title:"<spring:message code='global.lbl.roleNm' />", width:120
                  ,attributes:{"class":"ac"}
              }
              ,{title:""}
            ]
        });

        // User 그리드
        $("#userGrid").kendoExtGrid({
            dataSource:{
                 transport:{
                    read:{
                        url:"<c:url value='/cmm/mail/internalMail/selectInternalMailReceiverUsrByCondition.do' />"
                    }
                    , parameterMap:function(options, operation) {
                        if (operation === "read") {
                            var params = {};

                            params["sIntMailId"] = $("#sIntMailId").val();

                            return kendo.stringify(params);
                        } else if (operation !== "read" && options.models) {
                            return kendo.stringify(options.models);
                        }
                    }
                }
                , schema:{
                    model:{
                        id:"receiveSummId"
                      , fields:{
                            receiveSummId:{type:"string"}
                          , distCd:{type:"string"}
                          , distNm:{type:"string"}
                          , dlrCd:{type:"string"}
                          , dlrNm:{type:"string"}
                          , refTp:{type:"string"}
                          , refId:{type:"string"}
                          , usrNm:{type:"string"}
                        }
                    }
                }
            }
            ,height:150
            ,selectable:"row"
            ,editable:false
            ,navigatable:false
            ,pageable:false
            ,sortable:false
            ,multiSelectWithCheckbox:true
            ,columns:[
              {field:"distNm", title:"<spring:message code='global.lbl.area' />", width:150
                  ,attributes:{"class":"ac"}
              }
              ,{field:"dlrNm", title:"<spring:message code='global.lbl.dealer' />", width:150
                  ,attributes:{"class":"ac"}
              }
              ,{field:"refId", title:"<spring:message code='global.lbl.usrId' />", width:200
                  ,attributes:{"class":"ac"}
              }
              ,{field:"usrNm", title:"<spring:message code='global.lbl.usrNm' />", width:120
                  ,attributes:{"class":"ac"}
              }
              ,{title:""}
            ]
        });
    });
</script>
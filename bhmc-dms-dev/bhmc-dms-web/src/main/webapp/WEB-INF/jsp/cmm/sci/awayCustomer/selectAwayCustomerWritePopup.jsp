<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<section id="windows" class="pop_wrap">
    <div class="header_area">
        <div class="btn_right">
            <button id="btnPopupSave" class="btn_m btn_save"><spring:message code="global.btn.save" /></button>
            <button id="btnPopupDelete" class="btn_m btn_delete"><spring:message code="global.btn.del" /></button>
            <button id="btnPopupClose" class="btn_m btn_close"><spring:message code="global.btn.close" /></button>
        </div>
    </div>

    <input type="hidden" id="flag" name="flag" value="" />

    <div  class="table_form form_width_100per" role="search" data-btnid="btnSearch">
        <form id="searchForm">
            <input type="hidden" id="sRevDt" name="sRevDt" value="" />
            <input type="hidden" id="sRevStartHm" name="sRevStartHm" value="" />
            <input type="hidden" id="sRevEndHm" name="sRevEndHm" value="" />
        </form>

        <form id="saveForm">
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
                        <th scope="row" style="width:10%;"><spring:message code="global.lbl.startHm" /><!-- 시작시간 --></th>
                        <td>
                            <input id="startHm" name="startHm" class="form_datetimepicker">
                            <input type="hidden" id="revOldStartHm" name="revOldStartHm">
                            <input type="hidden" id="revNewStartHm" name="revNewStartHm">
                        </td>
                        <th scope="row" style="width:10%;"><spring:message code="global.lbl.endHm" /><!-- 종료시간 --></th>
                        <td>
                            <input id="endHm" name="endHm" class="form_datetimepicker">
                            <input type="hidden" id="revOldEndHm" name="revOldEndHm">
                            <input type="hidden" id="revNewEndHm" name="revNewEndHm">
                        </td>
                        <th scope="row"></th>
                        <td></td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="global.lbl.remark" /><!-- 비고 --></th>
                        <td colspan="5">
                            <input type="hidden" id="revOldDt" name="revOldDt" value="" />
                            <input type="hidden" id="revNewDt" name="revNewDt" value="" />

                            <textarea id="revCont" name="revCont" class="form_textarea" style="height:160px;"></textarea>
                        </td>
                    </tr>
                </tbody>
            </table>
        </form>
    </div>
</section>

<script type="text/javascript">
    $(document).ready(function() {
        $(".form_datetimepicker").kendoDateTimePicker({
            interval:60
            ,format:"<dms:configValue code='dateFormat' /> HH:mm"
        });

        /************************************************************
                    팝업옵션 설정
        *************************************************************/
        /**
         * 팝업 옵션
         */
         var options = parent.awayCustomerPopupWin.options.content.data;

         $("#flag").val(options.flag);
         $("#sRevDt").val(options.revDt);
         $("#sRevStartHm").val(options.revStartHm);
         $("#sRevEndHm").val(options.revEndHm);

         if ($("#flag").val() == "I") {
             $("#btnPopupDelete").hide();
         }
         else {
             $("#btnPopupDelete").show();
         }

         fnPopupInit = function() {
             var searchData = "";

             searchData = $("#searchForm").serializeObject();

             $.ajax({
                 url:"<c:url value='/cmm/sci/awayCustomer/selectAwayCustomerByPk.do' />"
               , data:JSON.stringify(searchData)
               , type:'POST'
               , dataType:'json'
               , async:false
               , contentType:'application/json'
               , error:function(jqXHR,status,error) {
                     // dms.notification.error(jqXHR.responseJSON.errors);
                 }
               , success:function(jqXHR, textStatus) {
                   $("#startHm").val(jqXHR.strRevDt + " " + jqXHR.revStartHm);
                   $("#endHm").val(jqXHR.strRevDt + " " + jqXHR.revEndHm);

                   $("#revOldDt").val(jqXHR.strRevDt);
                   $("#revNewDt").val(jqXHR.strRevDt);

                   $("#revOldStartHm").val(jqXHR.revStartHm);
                   $("#revOldEndHm").val(jqXHR.revEndHm);

                   $("#revCont").val(jqXHR.revCont);
                 }
             });
         }

         // 닫기 버튼.
         $("#btnPopupClose").kendoButton({
             click:function(e){
                 parent.awayCustomerPopupWin.close();
             }
         });

         // 버튼 - 저장
         $("#btnPopupSave").kendoButton({
             click:function(e) {
                 var tempUrl    = "";
                 var saveData   = "";

                 if ($("#flag").val() == "I") {
                     tempUrl = "<c:url value='/cmm/sci/awayCustomer/insertAwayCustomer.do' />";
                 }
                 else {
                     tempUrl = "<c:url value='/cmm/sci/awayCustomer/updateAwayCustomer.do' />";
                 }

                 if (confirm("<spring:message code='cmm.info.saveYn'/>")) {
                     $("#revNewDt").val($("#startHm").val().substring(0, 10));
                     $("#revNewStartHm").val($("#startHm").val().substring(11, 16));
                     $("#revNewEndHm").val($("#endHm").val().substring(11, 16));

                     if ($("#startHm").val() == "") {
                         // 시작 시간을 입력 하시기 바랍니다.
                         dms.notification.warning("<spring:message code='cmm.info.awayStartHmMsg' />");
                         $("#startHm").focus();
                         return;
                     }

                     if ($("#endHm").val() == "") {
                         // 종료 시간을 입력 하시기 바랍니다.
                         dms.notification.warning("<spring:message code='cmm.info.awayEndHmMsg' />");
                         $("#endHm").focus();
                         return;
                     }

                     if (($("#startHm").val().substring(0, 10) != $("#endHm").val().substring(0, 10))) {
                         // 동일일만 저장이 가능 합니다.
                         dms.notification.warning("<spring:message code='cmm.info.awaySameDateMsg' />");

                         return;
                     }

                     if (parseInt($("#startHm").val().substring(11, 16).replace(":", "")) >= parseInt($("#endHm").val().substring(11, 16).replace(":", ""))) {
                         // 시작 시간이 종료 시간보다 크거나 같을 수 없습니다.
                         dms.notification.warning("<spring:message code='cmm.info.awayStartEndMsg' />");

                         return;
                     }

                     saveData = $("#saveForm").serializeObject();

                     $.ajax({
                         url:tempUrl
                       , data:JSON.stringify(saveData)
                       , type:'POST'
                       , dataType:'json'
                       , async:false
                       , contentType:'application/json'
                       , error:function(jqXHR,status,error) {
                             dms.notification.error(jqXHR.responseJSON.errors);
                         }
                       , success:function(jqXHR, textStatus) {
                             var data = [];

                             if (jqXHR) {
                                 // 정상적으로 반영 되었습니다.
                                 dms.notification.success("<spring:message code='global.info.success'/>");

                                 options.callbackFunc(data);
                                 parent.awayCustomerPopupWin.close();
                             }
                             else {
                                 // 동일한 시간대에 이미 예약이 되어 있습니다.
                                 dms.notification.warning("<spring:message code='cmm.info.awaySameTimeMsg' />");
                             }
                         }
                     });
                 }
             }
         });

         // 버튼 - 삭제
         $("#btnPopupDelete").kendoButton({
             click:function(e) {
                 var tempUrl     = "";
                 var saveData    = "";

                 if (confirm("<spring:message code='cmm.info.delYn'/>")) {
                     $("#revNewDt").val($("#startHm").val().substring(0, 10));
                     $("#revNewStartHm").val($("#startHm").val().substring(11, 16));
                     $("#revNewEndHm").val($("#endHm").val().substring(11, 16));

                     saveData = $("#saveForm").serializeObject();

                     $.ajax({
                         url:"<c:url value='/cmm/sci/awayCustomer/deleteAwayCustomer.do' />"
                       , data:JSON.stringify(saveData)
                       , type:'POST'
                       , dataType:'json'
                       , async:false
                       , contentType:'application/json'
                       , error:function(jqXHR,status,error) {
                             dms.notification.error(jqXHR.responseJSON.errors);
                         }
                       , success:function(jqXHR, textStatus) {
                             var data = [];

                             if (jqXHR) {
                                 // 삭제가 완료 되었습니다.
                                 dms.notification.success("<spring:message code='global.info.deleteSuccess'/>");

                                 options.callbackFunc(data);
                                 parent.awayCustomerPopupWin.close();
                             }
                             else {
                                 dms.notification.warning("<spring:message code='cmm.info.awayWarningMsg' />");
                             }
                         }
                     });
                 }
             }
         });

         if (options.flag == "U") {
             fnPopupInit();
         }
    });
</script>
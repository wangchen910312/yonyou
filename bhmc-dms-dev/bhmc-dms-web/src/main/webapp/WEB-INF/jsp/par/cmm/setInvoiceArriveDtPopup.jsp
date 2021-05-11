<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
    <!-- 클레임건상태 변경 팝업 -->
    <section id="windows" class="pop_wrap">
        <div class="header_area">
            <div class="btn_right">
                <!-- 조회 버튼 -->
                <button id="btnSelect" class="btn_m btn_Select"><spring:message code="par.btn.send" /><!-- 선택 --></button>
            </div>
        </div>
        <div class="table_form">
            <table>
                <caption></caption>
                <colgroup>
                    <col style="width:30%;">
                    <col style="width:70%;">
                </colgroup>
                <tbody>
                     <tr>
                        <th scope="row"><span class="bu_required"><spring:message code="par.lbl.arrvDt" /><!--도착일자 --></span></th>
                        <td class="required_area">
                            <input id="arrvDt" class="form_datepicker" data-type="maskDate"/>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </section>

 <script type="text/javascript">

    $(document).ready(function() {

        /************************************************************
                    팝업옵션 설정
        *************************************************************/
        /**
         * 팝업 옵션
         */
         var options       = parent.setInvoiceArriveDtPopupWindow.options.content.data;

         $("#arrvDt").kendoExtMaskedDateTimePicker({
              format:"<dms:configValue code='dateFormat' /> HH:mm"
             ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
         });

         $("#arrvDt").data("kendoExtMaskedDateTimePicker").value(options.arrvDt);

        /************************************************************
                    조회조건 설정
        *************************************************************/

         // 적용 버튼
         $("#btnSelect").kendoButton({
             click:function(e){
                 var arrvDt,
                     arrvTm,
                     arrvDtTm;

                 arrvDtTm = $("#arrvDt").data("kendoExtMaskedDateTimePicker").value();
                 if(dms.string.isEmpty(arrvDtTm)){
                     //도착일자는 필수 입력 사항입니다.
                     dms.notification.warning("<spring:message code='par.lbl.arrvDt' var='arrvDt' /><spring:message code='global.info.required.field' arguments='${arrvDt}'/>");
                     return false;
                 }

                 options.callbackFunc($("#arrvDt").data("kendoExtMaskedDateTimePicker").value());
             }
         });

    });

 </script>


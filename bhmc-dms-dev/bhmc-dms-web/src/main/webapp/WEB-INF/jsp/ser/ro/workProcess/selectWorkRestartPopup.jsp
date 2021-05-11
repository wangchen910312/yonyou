<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<section id="windows" class="pop_wrap">

    <div class="table_form mt10">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:40%;">
                <col style="width:59%;">
                <col>
            </colgroup>
            <tbody>
                <%-- <tr>
                    <th scope="row"><spring:message code='ser.lbl.chgConformDt' /></th>
                    <td>
                        <input id="wrkEndDt" name="wrkEndDt" class="form_datepicker">
                    </td>
                </tr> --%>
                <tr>
                    <th scope="row"><spring:message code='ser.lbl.expcDlvDt' /></th>
                    <td class="readonly_area">
                        <input id="expcDlDt" name="expcDlDt" class="form_datepicker" readonly>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
     <div class="header_area">
        <div class="btn_right">
             <button class="btn_m" id="btnConf"><spring:message code='global.btn.confirm' /><!-- 확인 --></button>
            <button class="btn_m" id="btnCancel"><spring:message code='global.btn.close' /><!-- 닫기 --></button>
        </div>
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
         var options = parent.pauseRestartPopup.options.content.data;

         /* $("#wrkEndDt").kendoExtMaskedDateTimePicker({
             format:"<dms:configValue code='dateFormat' /> HH:mm"
             ,value:options.wrkEndDt
         }); */

         $("#expcDlDt").kendoExtMaskedDateTimePicker({
             format:"<dms:configValue code='dateFormat' /> HH:mm"
             ,value:options.expcDlDt
             ,enable:false
         });
        /************************************************************
                    기능버튼 설정
        *************************************************************/

        // 선택 버튼.
        $("#btnSelect").kendoButton({
            click:function(e){

                if(rows !== null)
                {
                    options.callbackFunc(data);
                }
            }
        });

       // 닫기 버튼.
        $("#btnCancel").kendoButton({
            click:function(e){
                parent.pauseRestartPopup.close();
            }
        });
        // 확인 버튼.
        $("#btnConf").kendoButton({
            click:function(e){
                var data = {};
                //data.wrkEndDt = $("#wrkEndDt").data("kendoExtMaskedDateTimePicker").value();
                //data.expcDlDt = $("#expcDlDt").data("kendoExtMaskedDateTimePicker").value();

                options.callbackFunc();
                parent.pauseRestartPopup.close();
            }
        });

});
</script>










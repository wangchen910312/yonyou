<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
    <!-- 선수금 확인 팝업 -->
    <section id="windows" class="pop_wrap">
        <div class="table_form" role="search" data-btnid="btnSearch">
            <table>
                <caption></caption>
                <colgroup>
                    <col style="width:15%;">
                    <col style="width:35%;">
                    <col style="width:15%;">
                    <col style="width:35%;">
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row"><spring:message code="global.lbl.mesgTxt" /><!-- 메세지 --></th>
                        <td colspan="3">
                            <input id="msg" class="form_input form_readonly" readonly />
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.avlbAmt" /><!-- 가용금액 --></th>
                        <td>
                            <input id="calcAmt" class="form_numeric" readonly />
                        </td>
                        <th scope="row"><spring:message code="par.lbl.lmtAmt" /><!-- 제한금액 --></th>
                        <td>
                            <input id="lmtAmt" class="form_numeric" readonly />
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
         var options  = parent.chkAdvanceReceivedPopupWindow.options.content.data;

         //가용금액
         $("#calcAmt").kendoExtNumericTextBox({
             format:"n0"
            ,spinners:false
         });

         //제한금액
         $("#lmtAmt").kendoExtNumericTextBox({
             format:"n0"
            ,spinners:false
         });


        /************************************************************
                    조회조건 설정
        *************************************************************/


        // 조회조건 설정
        $("#calcAmt").data("kendoExtNumericTextBox").value(options.calcAmt);
        $("#lmtAmt").data("kendoExtNumericTextBox").value(options.lmtAmt);
        $("#calcAmt").data("kendoExtNumericTextBox").enable(false);
        $("#lmtAmt").data("kendoExtNumericTextBox").enable(false);

        if(Number(options.calcAmt) < options.lmtAmt){
            $("#msg").val("<spring:message code='par.info.chkAdvanceReceived'/>");
        }

    });

 </script>


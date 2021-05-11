<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<section id="windows" class="pop_wrap">

    <div class="header_area">
        <div class="btn_right">
            <button id="btnSelect" class="btn_m btn_Select"><spring:message code="global.btn.select" /></button>
        </div>
    </div>

    <div class="table_form" role="select" data-btnid="btnSelect">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:15%;">
                <col style="width:18%;">
                <col style="width:15%;">
                <col style="width:18%;">
                <col style="width:15%;">
                <col>
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><spring:message code="ser.lbl.etcCd" /><!-- 기타코드 --></th>
                    <td class="readonly_area">
                        <input id="etcCd" type="text" class="form_input" readonly/>
                    </td>
                    <th scope="row"><spring:message code="ser.lbl.etcCdNm" /><!-- 기타사항명 --></th>
                    <td>
                        <input id="etcCdNm" type="text" class="form_input" />
                    </td>
                    <th scope="row"><spring:message code="ser.lbl.etcAmt" /><!-- 기타금액 --></th>
                    <td>
                        <input id="etcAmt" class="form_numeric ar" data-type="number" value="0.00" min="0" maxlength="3" />
                    </td>
                </tr>
            </tbody>
        </table>
    </div>

</section>

<script type="text/javascript">

    $("#etcAmt").kendoExtNumericTextBox({
        format:"n2"                // n0:###,###, n2:###,###.##
       ,decimals:2                // 소숫점
       ,min:0.00
       ,spinners:false
    });

    $(document).ready(function() {

        /************************************************************
                    팝업옵션 설정
        *************************************************************/
        /**
         * 팝업 옵션
         */
         var options = parent.etcIssueRegPopupWindow.options.content.data;

        /************************************************************
                    기능버튼 설정
        *************************************************************/
        // 선택 버튼.
        $("#btnSelect").kendoButton({
            click:function(e){
                var data = {
                            "etcCdNm":$("#etcCdNm").val()
                           ,"etcAmt":$("#etcAmt").data("kendoExtNumericTextBox").value()
                            };

                if(dms.string.strNvl(data.etcCdNm) == ""){
                    msgText = "<spring:message code='ser.lbl.etcCdNm' var='etcCdNm' />"+
                    "<spring:message code='global.info.required.field' arguments='${etcCdNm}' />";

                    return dms.notification.warning(msgText);
                }
                if(dms.string.strNvl(data.etcAmt) == ""){
                    msgText = "<spring:message code='global.lbl.oterAmt' var='etcAmt' />"+
                    "<spring:message code='global.info.required.field' arguments='${etcAmt}' />";

                    return dms.notification.warning(msgText);
                }

                options.callbackFunc(data);
            }
        });

    });

</script>

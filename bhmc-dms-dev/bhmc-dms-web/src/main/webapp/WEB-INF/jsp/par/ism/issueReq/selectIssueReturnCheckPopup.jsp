<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
    <!-- returnId popup -->
    <section id="window" class="pop_wrap">
        <div class="table_form mt10" role="search" data-btnid="btnSearch">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:32%;">
                <col style="width:60%;">
                <col>
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><span class="bu_required"><spring:message code="par.lbl.returner" /><!-- returner --></th>
                    <td class="required_area">
                        <!-- <input id="sReturnerNm" name="sReturnerNm" class="form_input" value="" /> -->
                        <input id="sReturnerNm" class="form_comboBox" />
                    </td>
                </tr>
                <tr>
                    <th scope="row"><span class="bu_required"><spring:message code="par.lbl.returnPartsQty" /><!-- returner --></th>
                    <td class="required_area">
                        <input id="sReturnPartsQty" class="form_numeric ar" />
                        <input type="hidden" id="endQty" />
                        <input type="hidden" id="endQtyTot" />
                        <input type="hidden" id="endQtyItemTot" />
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code="par.lbl.remark" /><!-- remark --></th>
                    <td>
                        <textarea id="sRemark" name="sRemark" rows="2" cols="30" class="form_textarea" ></textarea>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
        <div class="btn_bottom">
            <button class="btn_m" id="btnOk"><spring:message code="par.btn.yes" /><!-- btnOk --></button>
            <button class="btn_m" id="btnCancel"><spring:message code="par.btn.cancel" /><!-- btnCancel --></button>
        </div>
    </section>
    <!-- returnId popup -->
<!-- script -->
<script>
//techCdList
var tecCdList = [];
<c:forEach var="obj" items="${tecCdList}">
tecCdList.push({"tecId":"${obj.tecId}", "tecNm":"${obj.tecNm}"});
</c:forEach>

$(document).ready(function() {

    /************************************************************
        팝업옵션 설정
    *************************************************************/
    /**
    * 팝업 옵션
    */
    var options = parent.issueReturnPopupButtonWindow.options.content.data;

    // 확인 버튼.
    $("#btnOk").kendoButton({
        click:function(e){

            var endQty = $("#endQty").val();
            var endQtyItemTot = $("#endQtyItemTot").val();
            var endQtyTot = $("#endQtyTot").val();

            var returnPartsQty = $("#sReturnPartsQty").val();

            if($("#sReturnerNm").val() === ""){
                //returner is required.
                dms.notification.info("<spring:message code='par.lbl.returner' var='returner' /><spring:message code='global.info.required.field' arguments='${returner}' />");
                $("#sReturnerNm").focus();

                return false;
            }

            if(kendo.parseFloat(returnPartsQty) <= 0){
                //returnPartsQty count zero check message
                dms.notification.info("<spring:message code='par.lbl.returnPartsQty' var='returnPartsQty' /><spring:message code='par.info.issueOutZeroMsg' arguments='${returnPartsQty}' />");
                $("#sReturnPartsQty").focus();

                return false;
            }

            /* if(returnPartsQty > endQty || endQtyTot <= 0){
                //returnPartsQty count zero check message
                dms.notification.info("<spring:message code='par.lbl.returnPartsQty' var='returnPartsQty' /><spring:message code='par.lbl.giQty' var='giQty' /><spring:message code='par.info.itemReqCntMsg' arguments='${returnPartsQty},${giQty}' />");

                return false;
            } */

            if(kendo.parseFloat(returnPartsQty) > kendo.parseFloat(endQtyItemTot)){
                //returnPartsQty count zero check message
                dms.notification.info("<spring:message code='par.lbl.returnPartsQty' var='returnPartsQty' /><spring:message code='par.lbl.giQty' var='giQty' /><spring:message code='par.info.itemReqCntMsg' arguments='${returnPartsQty},${giQty}' />");

                return false;
            }

            options.callbackFunc({ flag:"Y", returnNm:$("#sReturnerNm").val(), returnPartsQty:returnPartsQty * -1, remark:$("#sRemark").val()});
            parent.issueReturnPopupButtonWindow.close();
        }
    });

    $("#btnCancel").kendoButton({
        click:function(e){
            parent.issueReturnPopupButtonWindow.close();
        }
    });

    //sReturnerNm dropdownlist
    $("#sReturnerNm").kendoExtDropDownList({
        dataTextField:"tecNm"
        ,dataValueField:"tecId"
        ,dataSource:tecCdList
        ,autoBind:true
        ,height:100
        ,index:0
    });

    //returnPartsQty
    $("#sReturnPartsQty").kendoExtNumericTextBox({
        format:"n2"
        ,decimals:2
        ,max:100
        ,min:0
        ,spinners:false
        ,value:1
    });

    //반품시 반품인 기 수령인 설정.
    if(options.receiveId !== undefined || options.receiveId !== null){
        $("#sReturnerNm").data("kendoExtDropDownList").value(options.receiveId);
        $("#endQty").val(options.endQty);
        $("#endQtyItemTot").val(options.endQtyItemTot);
        $("#endQtyTot").val(options.endQtyTot);
    }

});
</script>
<!-- //script -->
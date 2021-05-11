<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
    <!-- 부품판매 반품 팝업 -->
    <section id="windows" class="pop_wrap">
        <div class="table_form mt10">
            <table>
                <caption></caption>
                <colgroup>
                    <col style="width:40%;">
                    <col style="width:60%;">
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.giReturner" /><!-- 반품자 --></th>
                        <td>
                            <input id="returnId" data-type="combo" class="form_comboBox"/>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.grReturnQty" /><!-- 반품수량 --></th>
                        <td>
                            <input id="returnQty" class="form_numeric ar" />
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.remark" /><!-- REMARK --></th>
                        <td>
                            <textarea id="remark" name="sRemark" rows="2" cols="30" class="form_textarea" ></textarea>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div class="btn_bottom">
            <button id="btnOk" class="btn_m btn_save"><spring:message code="par.btn.yes" /><!-- 확인 --></button>
            <button id="btnCancel" class="btn_m btn_cancel"><spring:message code="par.btn.cancel" /><!-- 취소 --></button>
        </div>
    </section>

 <script type="text/javascript">
var tecCdList = [];
 tecCdList.push({"tecId":"", "tecNm":" "});
 <c:forEach var="obj" items="${tecCdList}" varStatus="status">
     tecCdList.push({"tecId":"${obj.tecId}", "tecNm":"${obj.tecNm}"});
 </c:forEach>

    $(document).ready(function() {

        /************************************************************
                    팝업옵션 설정
        *************************************************************/
        /**
         * 팝업 옵션
         */
         var options       = parent.setPartsSaleOrdReturnPopupWindow.options.content.data;



        /************************************************************
                    조회조건 설정
        *************************************************************/


         //반품자
         $("#returnId").kendoExtDropDownList({
              dataTextField:"tecNm"
             ,dataValueField:"tecId"
             ,dataSource:tecCdList
             ,autoBind:true
             ,height:100
             ,index:0
         });


         //returnQty
         $("#returnQty").kendoExtNumericTextBox({
             format:"n0"
             ,max:100
             ,min:0
             ,spinners:false
             ,value:1
             ,decimals:2
             ,restrictDecimals: true
         });


         if(dms.string.isEmpty(options.returnId)){
             $("#returnId").data("kendoExtDropDownList").value(options.returnId);
         }

      // 확인 버튼.
         $("#btnOk").kendoButton({
             click:function(e){

                 var endQty         = options.endQty,
                     preReturnQty   = options.preReturnQty,
                     returnQty      = $("#returnQty").val();

                 if($("#returnId").val() === ""){
                     //returner is required.
                     dms.notification.info("<spring:message code='par.lbl.returner' var='returner' /><spring:message code='global.info.required.field' arguments='${returner}' />");
                     $("#returnId").focus();

                     return false;
                 }

                 if(returnQty <= 0){
                     //returnPartsQty count zero check message
                     dms.notification.info("<spring:message code='par.lbl.returnPartsQty' var='returnPartsQty' /><spring:message code='par.info.issueOutZeroMsg' arguments='${returnPartsQty}' />");
                     $("#returnQty").focus();

                     return false;
                 }

                 if(returnQty > Number(endQty) - Number(preReturnQty)){
                     //returnPartsQty count zero check message
                     dms.notification.info("<spring:message code='par.lbl.returnPartsQty' var='returnPartsQty' /><spring:message code='par.lbl.giQty' var='giQty' /><spring:message code='par.info.itemReqCntMsg' arguments='${returnPartsQty},${giQty}' />");

                     return false;
                 }

                 options.callbackFunc({ flag:"Y", returnNm:$("#sReturnerNm").val(), returnQty:returnQty, remark:$("#sRemark").val()});
             }
         });

         $("#btnCancel").kendoButton({
             click:function(e){
                 parent.setPartsSaleOrdReturnPopupWindow.close();
             }
         });

    });

 </script>


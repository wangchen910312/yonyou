<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
    <!-- 신규로케이션 팝업 -->
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
                        <th scope="row"><spring:message code="par.lbl.lvlId" /><!-- 층급 --></th>
                        <td>
                            <input type="text" id="lvlId" class="form_input form_readonly" readonly />
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.lvlTxt" /><!-- 층급명칭 --></th>
                        <td>
                            <input type="text" id="lvlTxt" class="form_input form_readonly" readonly />
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.locId" /><!-- 로케이션 --></th>
                        <td>
                            <input type="text" id="locId" class="form_input"/>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.locNm" /><!-- 로케이션명칭 --></th>
                        <td>
                            <input type="text" id="locNm" class="form_input"/>
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
 var options;

    $(document).ready(function() {

        /************************************************************
                    팝업옵션 설정
        *************************************************************/
        /**
         * 팝업 옵션
         */
         options       = parent.setNewLocPopupWindow.options.content.data;

         $("#lvlId").val(options.newLocData.lvlId);
         $("#lvlTxt").val(options.newLocData.lvlTxt);
         $("#locId").attr('maxLength',options.newLocData.lgthCnt);

        /************************************************************
                    조회조건 설정
        *************************************************************/

        $("#locId").on('blur', function(e){
            var strAlpaCdTp = "L",
                strAllCdTp  = "C",
                strMask     = this.value,
                valueLengh  = this.value.length,
                iLgthCnt = options.newLocData.lgthCnt,
                cdTp = options.newLocData.cdTp;

            if(valueLengh > iLgthCnt){
                dms.notification.warning("<spring:message code='par.lbl.locId' var='locId' /><spring:message code='par.lbl.lgthCnt' var='lgthCnt' /><spring:message code='global.err.chkGreateParam' arguments='${locId},${lgthCnt}'/>");
                $("#locId").val("");
                return false;
            }

            if (cdTp == "U") {
                this.value = strMask.toUpperCase();
            } else if (cdTp == "L") {
                this.value = strMask.toLowerCase();
            }
        });

      // 확인 버튼.
         $("#btnOk").kendoButton({
             click:function(e){
                 var newLocData = options.newLocData;
                 /*
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
                 */

                 if(dms.string.isEmpty($("#locId").val())){
                     //returner is required.
                     dms.notification.info("<spring:message code='par.lbl.locId' var='locId' /><spring:message code='global.info.required.field' arguments='${locId}' />");
                     $("#locId").focus();

                     return false;
                 }

                 newLocData.locId = $("#locId").val();
                 newLocData.locNm = $("#locNm").val();
                 options.callbackFunc(newLocData);
             }
         });

         $("#btnCancel").kendoButton({
             click:function(e){
                 parent.setNewLocPopupWindow.close();
             }
         });

    });



 </script>


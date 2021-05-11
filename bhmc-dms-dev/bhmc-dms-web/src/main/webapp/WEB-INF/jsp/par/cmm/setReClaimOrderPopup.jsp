<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
    <!-- 클레임건상태 변경 팝업 -->
    <section id="windows" class="pop_wrap">
        <div class="header_area">
            <div class="btn_right">
                <!-- 조회 버튼 -->
                <button id="btnSend" class="btn_m btn_save"><spring:message code="par.btn.send" /><!-- 선택 --></button>
            </div>
        </div>
        <div class="table_form">
            <table>
                <caption></caption>
                <colgroup>
                    <col style="width:40%;">
                    <col style="width:60%;">
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.reclaimOrder" /><!-- 회수운송장번호 --></th>
                        <td>
                            <input id="reclaimOrder"  class="form_input"/>
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
         var options       = parent.setReClaimOrderPopupWindow.options.content.data,
             claimStatList = [];

        /************************************************************
                    조회조건 설정
        *************************************************************/

         // 전송 버튼
         $("#btnSend").kendoButton({
             click:function(e){

                 var saveData = {},
                     saveList = [],
                     rowData  = {};

                 for(var i = 0; i < options.data.length; i = i + 1){
                     rowData  = {};

                     if(dms.string.isEmpty($("#reclaimOrder").val())){
                         //회수운송장번호 정보는 필수 입력 사항입니다.
                         dms.notification.warning("<spring:message code='par.lbl.reclaimOrder' var='reclaimOrder' /><spring:message code='global.info.required.field' arguments='${reclaimOrder}'/>");
                         return false;
                     }

                     if(dms.string.isEmpty(options.data[i].claimNo)){
                         //클레임번호가 없습니다.
                         dms.notification.warning("<spring:message code='par.lbl.dmsClaimNo' var='claimNo' /><spring:message code='global.info.required.field' arguments='${claimNo}'/>");
                         return false;
                     }

                     if(dms.string.isEmpty(options.data[i].claimCode)){
                         //클레임번호가 없습니다.
                         dms.notification.warning("<spring:message code='par.lbl.claimNo' var='claimNo' /><spring:message code='global.info.required.field' arguments='${claimNo}'/>");
                         return false;
                     }

                     rowData.claimNo      = options.data[i].claimNo;
                     rowData.claimCode    = options.data[i].claimCode;
                     rowData.reclaimOrder = $("#reclaimOrder").val();
                     saveList.push(rowData);
                 }

                 saveData = {"qualityClaimList":saveList};
                 $.ajax({
                     url:"<c:url value='/par/pcm/claim/sendReClaimOrder.do' />"
                   , type:"POST"
                   , data:JSON.stringify(saveData)
                   , dataType:"json"
                   , contentType:'application/json'
                   , async:true
                   , success:function(result) {

                       if (result == true) {
                           dms.notification.success("<spring:message code='par.lbl.claim' var='claim' /><spring:message code='global.info.modifySuccessParam' arguments='${claim}'/>");
                       } else {
                           if(result === 0){
                               dms.notification.error("<spring:message code='par.lbl.claim' var='claim' /><spring:message code='global.err.modifyFailedParam' arguments='${claim}'/>");
                           }
                           // 에러 메시지 확인.
                       }
                   }
                   ,beforeSend:function(){
                       dms.loading.show($("#windows"));
                   }
                   ,complete:function(){
                       dms.loading.hide($("#windows"));
                   }
                   , error:function(jqXHR,status,error) {
                       dms.loading.hide($("#windows"));
                       dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                   }
               });

             }
         });

    });

 </script>


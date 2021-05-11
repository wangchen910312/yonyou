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
                        <th scope="row"><spring:message code="par.lbl.claimStatus" /><!-- 클레임건 상태 --></th>
                        <td>
                            <input id="wornStatus" data-type="combo" class="form_comboBox"/>
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
         var options       = parent.setQualityClaimStatusPopupWindow.options.content.data,
             claimStatList = [];

         claimStatList.push({"cmmCd":"", "cmmCdNm":" ", "useYn":""});
         <c:forEach var="obj" items="${claimStatList}" varStatus="status">
             claimStatList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
         </c:forEach>

        /************************************************************
                    조회조건 설정
        *************************************************************/


         //클레임상태
         $("#wornStatus").kendoExtDropDownList({
              dataTextField:"cmmCdNm"
             ,dataValueField:"cmmCd"
             ,dataSource:claimStatList
             ,index:0
         });

         // 전송 버튼
         $("#btnSend").kendoButton({
             click:function(e){

                 var saveData = {},
                     saveList = [];

                 for(var i = 0; i < options.data.length; i = i + 1){
                     var rowData  = {};
                     if(dms.string.isEmpty($("#wornStatus").data("kendoExtDropDownList").value())){
                         //클레임 상태 정보는 필수 입력 사항입니다.
                         dms.notification.warning("<spring:message code='par.lbl.claimStatus' var='claimStatus' /><spring:message code='global.info.required.field' arguments='${claimStatus}'/>");
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

                     rowData.claimNo    = options.data[i].claimNo;
                     rowData.claimCode  = options.data[i].claimCode;
                     rowData.wornStatus = $("#wornStatus").data("kendoExtDropDownList").value();
                     saveList.push(rowData);
                 }

                 saveData = {"qualityClaimList":saveList};

                 $.ajax({
                     url:"<c:url value='/par/pcm/claim/sendQuelityClaimStatus.do' />"
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


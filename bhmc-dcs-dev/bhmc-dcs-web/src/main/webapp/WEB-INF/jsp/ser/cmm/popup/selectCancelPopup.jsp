<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<section id="window" class="pop_wrap">
    <div class="header_area">
        <%-- <h1 class="title_basic"><spring:message code="ser.lbl.cancReasonCd" /></h1> --%>
        <div class="btn_right">
            <button type="button" id="btnCreate" class="btn_m btn_create"><spring:message code="global.btn.create" /></button>
           <%--  <button type="button" id="btnCancel" class="btn_m btn_cancel"><spring:message code="global.btn.cancel" /></button> --%>
        </div>
    </div>
     
    <div class="table_form form_width_20per">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:13%;">
                <col>
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><spring:message code='ser.lbl.cancReasonCd' /></th>    <!--정책설명 -->
                    <td>
                        <textarea id="cancReasonCont" name="cancReasonCont" rows="9" cols="" class="form_textarea"></textarea>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>

</section>

<!-- script -->
<script>
 
$(document).ready(function() {
    // 팝업 설정값
    var parentData = parent.cancelPopup.options.content.data;
 

    // 확정 버튼
    $("#btnCreate").kendoButton({
        click:function(e){
            
            
            
            parentData.callbackFunc({ cancReasonCont:$("#cancReasonCont").val()});
            parent.cancelPopup.close();

            /* if($("#tpCd").val() == ""){
                // {차량유형}를(을) 선택해주세요.:계약고객
                dms.notification.info("<spring:message code='global.lbl.carType' var='globalLblCarType' /><spring:message code='global.info.chkSelectItemMsg' arguments='${globalLblCarType}' />");
                return false;
            }

            if( dms.string.trim($("#policyCont").val()) == ""){
                dms.notification.info("<spring:message code='global.lbl.policyCont' var='globalLblPolicyCont' /><spring:message code='global.info.chkSelectItemMsg' arguments='${globalLblPolicyCont}' />");
                return false;
            }

            var param = {};
            param.tpCd = $("#tpCd").val();
            param.policyCont = $("#policyCont").val();

            $.ajax({
                url:"<c:url value='/sal/svo/testDriveVehicle/confirmPolicyInputPopup.do' />",
                data:JSON.stringify(param),
                type:'POST',
                dataType:'json',
                contentType:'application/json',
                error:function(jqXHR,status,error) {
                    dms.notification.error(jqXHR.responseJSON.errors);
                },
                success:function(jqXHR, textStatus) {
                    //정상적으로 반영 되었습니다.
                    dms.notification.success("<spring:message code='global.info.success'/>");

                     var data = [];
                     data.msg = 'close';
                     options.callbackFunc(data);
                     parent.popupWindow2.close();
                }
            }); */
        }
    });

     


});
 


</script>
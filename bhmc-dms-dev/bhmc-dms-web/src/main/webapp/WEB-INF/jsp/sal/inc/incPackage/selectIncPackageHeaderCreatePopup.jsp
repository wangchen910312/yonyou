<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 패키지생성 팝업 -->
<section id="window" class="pop_wrap">
    <div class="header_area">
        <div class="btn_right">
            <button id="btnSave" class="btn_m"><spring:message code='global.btn.save' /></button>  <!-- 저장 -->
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
                    <th scope="row"><spring:message code='sal.lbl.packageNo' /></th>      <!-- 패키지번호 -->
                    <td>
                        <input type="text" id="packageNo" size="30" maxlength="30" class="form_input" />
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code='sal.lbl.packageNm' /></th>      <!-- 패키지명 -->
                    <td>
                        <input type="text" id="packageNm" size="60" maxlength="60" class="form_input" />
                    </td>
                </tr>
            </tbody>
        </table>
    </div>

</section>
<!-- //패키지생성 팝업 -->

<script>


$(document).ready(function() {

    // 팝업 설정값
    var options = parent.popupWindow.options.content.data;

    // 저장
    $("#btnSave").kendoButton({
        click:function(e){
            var saveData = {};
            saveData.packageNo = $("#packageNo").val();
            saveData.packageNm = $("#packageNm").val();
            
            $.ajax({
                url:"<c:url value='/sal/inc/incPackage/multiIncPackageHeaderSave.do' />"
                ,data:JSON.stringify(saveData)
                ,type:'POST'
                ,dataType:'json'
                ,contentType:'application/json'
                ,error:function(jqXHR, status, error) {
                    dms.notification.error(jqXHR.responseJSON.errors);
                }
                ,success:function(jqXHR, textStatus) {
                    options.callbackFunc();                    
                }
            });
        }
    });
});
</script>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- issueReqResvReadyAct -->
<section class="group">
    <div class="header_area">        
            <div class="btn_left">			
                <button id="btnSend" name="btnSend" class="btn_m btn_reset"><spring:message code="par.btn.init" /></button>            </div>
            <div class="btn_right">            
            </div>
    </div>

    <input id="sResultYn" name="sResultYn" class="form_input" />

</section>
<!-- //issueReqResvReadyAct -->



<!-- script -->
<script>    

    $(document).ready(function() {
        //btnSend
        $("#btnSend").kendoButton({
            click:function(e){
                
                $.ajax({
                    url:"<c:url value='/par/bat/issueReserve/multiBatchPartsIssueReadyActionCancel.do' />"
                    ,data:JSON.stringify({})
                    ,type:'POST'
                    ,dataType:'json'
                    ,contentType:'application/json'
                    ,error:function(jqXHR,status,error){
                        dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                    }
                    ,success:function(jqXHR, textStatus){                        
                        // success message
                        dms.notification.success("<spring:message code='global.info.success'/>");
                    }                    
                });
                
            }
        });
    });
</script>
<!-- //script -->

<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<section class="group">
    <div class="header_area">
        <h1 class="title_basic"><%-- <spring:message code="par.title.parReqConfirmStatus" /> --%><!-- parReqConfirmStatus --></h1>
            <div class="btn_left">
                <button class="btn_m" id="btnGwmsMarkup" type="button"><span>Gwms-Markup</span></button>
                <button class="btn_m" id="btnGwmsPrice" type="button"><span>Gwms-Price</span></button>
            </div>
    </div>
</section>

<!-- script -->
<script>

$(document).ready(function() {

    //btnGwmsMarkup
    $("#btnGwmsMarkup").kendoButton({
        enable:true
        ,click:function(e){

            $.ajax({
                url:"<c:url value='/bat/par/pmm/selectBatchGwmsPartsMarkupProcedure.do' />"
                ,data:kendo.stringify({})
                ,type:'POST'
                ,dataType:'json'
                ,contentType:'application/json'
                ,async:false
                ,success:function(result) {
                    console.log("result : ",result);
                }
                ,error:function(jqXHR,status,error) {
                    dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                }

             });

        }
    });
    //btnGwmsPrice
    $("#btnGwmsPrice").kendoButton({
        enable:true
        ,click:function(e){

            $.ajax({
                url:"<c:url value='/bat/par/pmm/selectBatchGwmsPartsPriceProcedure.do' />"
                ,data:kendo.stringify({})
                ,type:'POST'
                ,dataType:'json'
                ,contentType:'application/json'
                ,async:false
                ,success:function(result) {
                    console.log("result : ",result);
                }
                ,error:function(jqXHR,status,error) {
                    dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                }

             });
        }
    });

});

</script>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<form method="post" name="frmCustStatus" id="frmCustStatus">
<div class="header_area">
    <div class="left_area ml0">
        <span class="span_txt"><spring:message code="mis.lbl.searchYm" /></span><!-- 조건검색  -->
        <input type="text" id="sMisCustDate" name="sMisCustDate" value="${totalMisStatusVO.sMisCustDate}" style="width:150px;" class="form_comboBox" >
		<dms:access viewId="VIEW-D-10779" hasPermission="${dms:getPermissionMask('READ')}">        
        	<button type="button" class="btn_s" id="btnMisCustSearch" name="btnMisCustSearch"><spring:message code="global.btn.search" /></button>
		</dms:access>
    </div>
    <div class="btn_right">
        <!-- <button type="button" class="btn_s" id="btnCycleSet" name="btnCycleSet">전체 화면 보기</button>  -->
    </div>
</div>
<br>
<div class="table_info table_info_v1">
<iframe id="iframeCustStatus" name="iframeCustStatus" src="" frameborder="0" scrolling="no" width="100%" height="750"></iframe>
</div>
</form>

<!-- script -->
<script type="text/javascript">

function custStatusCall(){
    var custStatusUrl = "<c:url value='/ReportServer?formlet=/mis/selectCustTotalReport.frm' />";
    $("#iframeCustStatus").attr("src", custStatusUrl);
}

$(document).ready(function() {

    $("#sMisCustDate").kendoDatePicker({
         value:"${sysdate}"
        ,start:"year"
        ,depth:"year"
        ,format:"yyyyMM"
    });

    $("#sMisCustDate").kendoMaskedTextBox({
        mask:"######"
    });

    var now = new Date();

    function leadingZeros(n, digits) {
        var zero = '';
        n = n.toString();
        if (n.length < digits) {
            for (i = 0; i < digits - n.length; i++)
                zero += '0';
        }
        return zero + n;
    }

    //$("#sMisCustDate").val(leadingZeros(now.getFullYear(), 4) + leadingZeros(now.getMonth()+1, 2));

    if('${totalMisStatusVO.sMisCustDate}' == "" || '${totalMisStatusVO.sMisCustDate}' == 'null') {
        $("#sMisCustDate").val(leadingZeros(now.getFullYear(), 4) + leadingZeros(now.getMonth()+1, 2));

    } else {

        $("#sMisCustDate").val('${totalMisStatusVO.sMisCustDate}');
    }

    $("#btnMisCustSearch").kendoButton({
        click:function(e) {
            $('#frmCustStatus').submit();
           }
    });

    $("#btnCustCycleSet").kendoButton({
        click:function(e) {
            var newWindow=open("/ReportServer?formlet=/mis/selectCustTotalReport.frm","",'top=0,left=0,width='+(screen.availWidth)+',height='+(screen.availHeight)+',toolbar=0,location=0,directories=0,status=0,menubar=0,resizable=1,scrolling=0,scrollbars=1');
           }
    });

    $(".tab_area").kendoExtTabStrip({
        animation:false
    });

    custStatusCall();

});
</script>
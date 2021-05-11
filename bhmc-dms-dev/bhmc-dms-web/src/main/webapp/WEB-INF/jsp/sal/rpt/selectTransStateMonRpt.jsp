<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<%--
    JSP Name : selectTransStateMonRpt.jsp
    Description : 월간인도임무 명세서
    author choi Byunggwon
    since 2017. 3. 23.
    version 1.0
    Modification Information
       since          author              description
    ===========    =============    ===========================
    2017. 3. 23.    choi Byunggwon   최초 생성
--%>

<!-- [DMS] 월간인도임무 명세서 -->
<section class="group">
    <div class="header_area">
        <h1 class="title_basic"><spring:message code="sal.rpt.salestransstatemon" /></h1>
        <div class="btn_right">
            <%-- <dms:access viewId="VIEW-D-13016" hasPermission="${dms:getPermissionMask('READ')}"> --%>
                <button class="btn_m" id="btnSearch" name="btnSearch"><spring:message code="global.btn.search" /></button>
            <%-- </dms:access> --%>
        </div>
    </div>

    <div class="table_form" role="search" data-btnid="btnSearch">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:10%;">
                <col style="width:15%;">
                <col style="width:10%;">
                <col style="width:15%;">
                <col style="width:10%;">
                <col style="width:15%;">
                <col style="width:10%;">
                <col style="width:15%;">
            </colgroup>

            <tbody>
                 <tr>
                    <th scope="row"><span class="bu_required"><spring:message code="sal.lbl.ordYyMm" /></span></th>
                    <td>
                        <input type="text" id="sSrartYyMm" name="sSrartYyMm" value="" class="form_datepicker" style="width:150px;">
                    </td>
                    <th scope="row"><spring:message code='global.lbl.carlineNm' /></th> <!-- 차종명 -->
                    <td>
                        <input id="sCarlineCd" class="form_comboBox" />
                    </td>
                    <th scope="row"></th>
                    <td></td>
                    <th scope="row"></th>
                    <td></td>
                </tr>
            </tbody>
        </table>
    </div>

    <br>
    <div class="table_info table_info_v1">
        <iframe id="iframeTransStateMonRpt" name="iframeTransStateMonRpt" src="" frameborder="0" scrolling="auto" width="100%" height="650" class='report'></iframe>
    </div>
</section>


<!-- script -->
<script type="text/javascript">

//딜러코드
var dlrCd  = "${dlrCd}";


//차종조회
var carlineCdList = [];
var carlineCdMap = [];
<c:forEach var="obj" items="${carlineCdList}">
  carlineCdList.push({carlineNm:"${obj.carlineNm}", carlineCd:"${obj.carlineCd}"});
  carlineCdMap["${obj.carlineCd}"] = "${obj.carlineNm}";
</c:forEach>

function mainCall(){
    var rptUrl = "<c:url value='/ReportServer?reportlet=/sale/selectTransStateMonRpt_ing.cpt' />&op=view";
    var param = "";

    var sSrartYyMm = $("#sSrartYyMm").val();

    param += "&sDlrCd="+dlrCd;
    param += "&sSrartYyMm="+sSrartYyMm;
    param += "&sCarlineCd="+$("#sCarlineCd").data("kendoExtDropDownList").value();
    //param += "&__bypagesize__=false";

    $("#iframeTransStateMonRpt").attr("src", rptUrl + param);
}

$(document).ready(function() {

    // 조회조건 :  차종유형
    $("#sCarlineCd").kendoExtDropDownList({
        dataTextField:"carlineNm"
        ,dataValueField:"carlineCd"
        ,dataSource:carlineCdList
        ,optionLabel:" "
        ,index:0
    });

    // 조회조건 :  YYYYMM
    $("#sSrartYyMm").kendoDatePicker({
        value:"${sysdate}"
       ,start:"year"
       ,depth:"year"
       ,format:"yyyyMM"
   });

   $("#sSrartYyMm").kendoMaskedTextBox({
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

   $("#sSrartYyMm").val(leadingZeros(now.getFullYear(), 4) + leadingZeros(now.getMonth()+1, 2));

   $("#btnSearch").kendoButton({
        click:function(e) {

            if (dms.string.isEmpty($("#sSrartYyMm").val())){
                dms.notification.warning("<spring:message code='sal.lbl.ordYyMm' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                $("#sSrartYyMm").focus();
                return false;
            }

            mainCall();
           }
    });

    mainCall();

});
</script>
<!-- //[DMS] 월간인도임무 명세서 -->
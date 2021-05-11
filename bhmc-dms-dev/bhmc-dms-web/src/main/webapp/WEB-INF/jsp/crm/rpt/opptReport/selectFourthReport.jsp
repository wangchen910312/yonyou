<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.crm-1.0.js' />"></script>

 <div class="fsearch_area">
     <div class="header_area">
         <div class="btn_right">
             <button type="button" class="btn_s btn_search" id="btnReportSearch" name="btnReportSearch"><spring:message code='global.btn.search' /><!-- 조회 --></button>
         </div>
     </div>
     <div class="table_form" role="search" data-btnid="btnReportSearch">
         <table>
             <colgroup>
                <col style="width:8%;">
                <col style="width:17%;">
                <col style="width:8%;">
                <col style="width:17%;">
                <col style="width:8%;">
                <col style="width:17%;">
                <col style="width:8%;">
                <col style="width:17%;">
             </colgroup>
             <tbody>
                 <tr>
                     <th scope="row"><spring:message code='crm.lbl.opptRegistDt' /></th><!-- 线索下发时间 리드 내려보낸 시간 -->
                     <td>
                         <input id="sDt" class="form_datepicker" />
                     </td>
                     <th></th>
                     <td></td>
                     <th></th>
                     <td></td>
                     <th></th>
                     <td></td>
                 </tr>
             </tbody>
         </table>
     </div>
 </div>
 <div class="table_info table_info_v1">
     <iframe id="iframeReport" name="iframeReport" src="" frameborder="0" scrolling="no" width="100%" height="600" class="report"></iframe>
 </div>
 <script type="text/javascript">
     function reportCall(){
         var reportParam =  "&sDlrCd=<c:out value='${sDlrCd}' />";
         reportParam += "&sMonthFormat=<dms:configValue code='monthFormat' />";
         reportParam += "&sDateFormat=<dms:configValue code='dateFormat' />";
         reportParam += "&sDt="+$("#sDt").val();
         $("#iframeReport").attr("src", "<c:url value='/ReportServer?reportlet=crm/opptReport/selectFourthReport.cpt' />&op=view"+reportParam);
     };

     $(document).ready(function() {
         $("#btnReportSearch").kendoButton({
             click:function(e) {
                 reportCall();
             }
         });
         $("#sDt").kendoExtMaskedDatePicker({
             format:"<dms:configValue code='monthFormat' />"
             ,start:"year"
             ,depth:"year"
             ,value:"<c:out value='${sDt}'/>"
             ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
         });
         reportCall();
     });
 </script>
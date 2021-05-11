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
                <caption></caption>
                <colgroup>
                    <col style="width:8%;">
                    <col style="width:23%;">
                    <col style="width:8%;">
                    <col style="width:15%;">
                    <col style="width:8%;">
                    <col style="width:15%;">
                    <col style="width:8%;">
                    <col style="width:15%;">
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row"><spring:message code="crm.lbl.visitDate" /><!-- 대응날짜 --></th>
                        <td>
                            <div class="form_float">
                                <div class="date_left">
                                    <input id="sStartDt" name="sStartDt" class="form_datepicker" />
                                    <span class="txt_from">~</span>
                                </div>
                                <div class="date_right">
                                    <input id="sEndDt" name="sEndDt" class="form_datepicker" />
                                </div>
                            </div>
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
    <iframe id="iframeReport" name="iframeReport" src="" frameborder="0" scrolling="no" width="100%" height="600" class="report" data-offset="10"></iframe>
</div>

<script type="text/javascript">

    function reportCall(){
    	var startDate = $("#sStartDt").val();
    	var endDate = $("#sEndDt").val();
        var reportParam =  "&sDlrCd="+"<c:out value='${sDlrCd}' />";
        //reportParam += "&sDateFormat="+"<dms:configValue code='dateFormat' />";
        reportParam += "&sStartDt="+$("#sStartDt").val().replace("-","").replace("-","");
        reportParam += "&sEndDt="+$("#sEndDt").val().replace("-","").replace("-","");
        reportParam += "&startDt="+startDate.substring(0,7);
        reportParam += "&endDt="+endDate.substring(0,7);
        $("#iframeReport").attr("src", "<c:url value='/ReportServer?reportlet=crm/exhiHallReport/selectInitialRetentionrate.cpt' />&op=view"+reportParam);
    }
    $(document).ready(function() {
        // 조회 - 버튼
        $("#btnReportSearch").kendoButton({
            click:function(e){
                if(crmJs.isDateValidPeriod($("#sStartDt").data("kendoExtMaskedDatePicker").value()
                        ,$("#sEndDt").data("kendoExtMaskedDatePicker").value(),'<spring:message code="global.err.checkDateValue"/>')){
                	
                	if(checkTime()){
                		 reportCall();
                	}
                   
                }else{
                    $("#sEndDt").data("kendoExtMaskedDatePicker").value(new Date(''));
                    $("#sEndDt").focus();
                }
                
                
            }
        });

        // 开始
        $("#sStartDt").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,value:"<c:out value='${sStartDt}' />"
            ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        });

        // 结束
        $("#sEndDt").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,value:"<c:out value='${sEndDt}' />"
            ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        });
        
        function checkTime(){
        	
        	var begintime = $("#sStartDt").val();
        	var endtime = $("#sEndDt").val();
        	
            //var begintime = document.getElementById('startTime').value;
            //var endtime = document.getElementById('endTime').value;
            var flag = true;
            
            //if(!endtime){
              //  return true;
            //} 
            
            var time1 = new Date(begintime).getTime();
            var time2 = new Date(endtime).getTime();
            if(begintime==''){
            	flag = false;
            	//dms.notification.warning("<spring:message code='crm.lbl.alreadyBMResponse' />");
            	dms.notification.warning("<spring:message code='crm.lbl.vocActiveStartDt' /><spring:message code='crm.info.dateCanNotNull' />");
            	//dms.notification.warning("开始时间不能为空");
                //alert("开始时间不能为空");
                return ;
            }
            if(endtime==''){
            	flag = false;
                //alert("结束时间不能为空");
                dms.notification.warning("<spring:message code='crm.vocActiveEndDt' /><spring:message code='crm.info.dateCanNotNull' />");
                //dms.notification.warning("结束时间不能为空");
                return ;
            }
            if(time1 > time2){
            	flag = false;
            	//dms.notification.warning("开始时间不能大于结束时间");
                //alert("开始时间不能大于结束时间");
                dms.notification.warning("<spring:message code='sal.err.compFromDateSmall' />");
                return ;
            }

            //判断时间跨度是否大于3个月
            var arr1 = begintime.split('-');
            var arr2 = endtime.split('-');
            arr1[1] = parseInt(arr1[1]);
            arr1[2] = parseInt(arr1[2]);
            arr2[1] = parseInt(arr2[1]);
            arr2[2] = parseInt(arr2[2]);
            
            if(arr1[0] == arr2[0]){//同年
                if(arr2[1]-arr1[1] > 6){ //月间隔超6个月
                    flag = false;
                }else if(arr2[1]-arr1[1] == 6){ //月相隔6个月，比较日
                    if(arr2[2] > arr1[2]){ //结束日期的日大于开始日期的日
                        flag = false;
                    }
                }
            }else{ //不同年
                if(arr2[0] - arr1[0] > 1){
                    flag = false;
                }else if(arr2[0] - arr1[0] == 1){
                    if(arr1[1] < 10){ //开始年的月份小于10时，不需要跨年
                        flag = false;
                    }else if(arr1[1]+6-arr2[1] < 12){ //月相隔大于6个月
                        flag = false;
                    }else if(arr1[1]+6-arr2[1] == 12){ //月相隔6个月，比较日
                        if(arr2[2] > arr1[2]){ //结束日期的日大于开始日期的日
                            flag = false;
                        }
                    }
                }
            }
            if(!flag){
                //alert("时间跨度不得超过6个月！");
                flag = false;
                //crm.info.timeNotExceedSixMonths
                //dms.notification.warning("时间跨度不得超过6个月！");
                dms.notification.warning("<spring:message code='crm.info.timeNotExceedSixMonths' />");
                return ;
            }
            return flag;
        }

        reportCall();
        
        
       
    });
</script>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<dms:configValue code='dateFormat' var="_dateFormat" />
<dms:configValue code='dateTimeFormat' var="_dateTimeFormat" />

<div id="resizableContainer">
<section class="group">
    <div class="header_area">
        <h1 class="title_basic"><spring:message code='global.lbl.order' /><spring:message code='global.lbl.update' /></h1>
        <div class="btn_right">
            <button id="batchSearchDcsOrder" class="btn_m">初始化差异数据</button>        <!-- 初始化差异数据 -->
            <button id="batchSearchDms" class="btn_m"><spring:message code='sal.btn.back' /></button>        <!-- 差异对比 -->
            <button id="btnSearch" class="btn_m btn_search"><spring:message code='global.btn.search' /></button><!-- 查询 -->
            <button id="btnExcelExport" class="btn_m btn_excel"><spring:message code='sal.lbl.excelDownload' /></button><!-- 下载 -->
            <%-- <button id="help"  class="btn_m btn_link"><spring:message code='sal.btn.help' /></button> --%>         <!-- 帮助 -->
        </div>
    </div>
    <div class="table_form form_width_70per" role="search" data-btnid="btnSearch">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:5%;">
                <col style="width:5%;">
                <col style="width:5%;">
                <col style="width:10%;">
                <col style="width:5%;">
                <col style="width:5%;">
                <col style="width:5%;">
                <col style="width:55%;">
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><spring:message code='sal.lbl.date' /></th>  <!-- 사업부 -->
                    <td>
                        <input id="sModelCd" class="form_datepicker" size="8">
                    </td>
                    <th scope="row"><spring:message code='global.lbl.pgssRate' /></th>  <!-- 사업부 -->
                    <td>
                        <input id="hasCheck" type="text" size="4"/>/<input id="allCheck" type="text" size="4"/>
                    </td>
                    <th scope="row">执行经销商</th>  <!-- 사업부 -->
                    <td>
                        <textarea data-name="sDlrCd"  rows="4" cols="15" id="sDlrCd" name="sDlrCd" style="height: 150px;" class="form_textarea" data-json-obj="true"></textarea>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>

    <div class="table_grid mt10">
        <h1 class="title_basic"><spring:message code='sal.title.differences' /></h1>
        <div id="grid" class="resizable_grid"></div>
    </div>
</section>

<!--帮助窗口-->
<section id="evalPopupWindow" class="pop_wrap">
            <div class="header_area">
            <th><span  style="color:red">执行说明</span></th>
            </div>
            <div class="table_form form_width_100per">
                <table>
                    <tbody>
                        <tr>
	                        <td>
	                        	<span  style="color:red">1.选择时间,执行差异对比,找出存在差异的数据信息。</span>
	                        </td>
                        </tr>
                        <tr>
	                        <td>
	                        	<span  style="color:red">2.执行sql需填写要执行的sql和日期。</span>
	                        </td>
                        </tr>
                        <tr>
	                        <td>
	                        	<span  style="color:red">3.查询按钮,将完成差异对比的数据展示在前台页面。</span>
	                        </td>
                        </tr>
                    </tbody>
                </table>
            </div>
</section>
</div>

<script>
//시스템 날짜 정보 가져오기.
var vDateTimeFormat = "${_dateTimeFormat}";
//yyyy-MM-dd HH:mm:ss
var vDtyyyyMMddHHmmss = vDateTimeFormat;
//yyyy-MM-dd HH:mm
var vDtyyyyMMddHHmm = vDateTimeFormat.substring(0,16);
// yyyy-MM-dd
//var vDtyyyyMMdd = vDateTimeFormat.substring(0,10);
var vDtyyyyMMdd = "${_dateFormat}";
// HH:mm
var vDtHHmm = vDateTimeFormat.substring(11,16);
//HH:mm
var vDtyyyyMM = vDateTimeFormat.substring(0,6);

var userId = "${userId}";
var userNm = "${userNm}";

var checkMonth = "${checkMonth}";       // 해당월 1일
$("#sModelCd").val(checkMonth);

//定时器，用于循环跑列表查询
var timerId = null;

$(document).ready(function() {
	
	$("#evalPopupWindow").kendoWindow({
        animation:false
        ,draggable:false
        ,modal:true
        ,resizable:false
        ,visible:false
        ,title:"<spring:message code='sal.btn.help' />"                            
        ,width:"500px"
        ,height:"200px"
        ,open:function(e){
           
        }
        ,close:function(e){
            
        }
    }).data("kendoWindow");
	
	$("#sModelCd").kendoExtMaskedDatePicker({
		 start: "year"
		,depth:"year"
		,format :"yyyy-MM"
	    ,dateValidMessage :"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
	});
	
    $("#btnSearch").kendoButton({       // 조회
        enable:true,
        click:function(e){
            $('#grid').data('kendoExtGrid').dataSource.read();
        }
    });
    
    $("#btnExcelExport").kendoButton({
        click:function(e) {
            dms.ajax.excelExport({
                "beanName":"salesMonthService"
                ,"templateFile":"DmsSalesOrderSearch_Tpl.xlsx"
                ,"fileName":"DmsSalesOrderSearch_Tpl.xlsx"
                ,"downloadType":'selectDmsSalesOrderSearchMain'
                ,"checkMonth":$("#sModelCd").val().replace(/-/gi, "")
            });
        }
    });

    $("#help").kendoButton({   //帮助
        enable:true,
        click:function(e){
        	var win = $("#evalPopupWindow").data("kendoWindow");
        	win.center();
      	  	win.open();	
        }
    });
    
    $("#batchSearchDcsOrder").kendoButton({      // 승인
        enable:true,
        click:function(e){
        	collect();
        }
    });
    
    $("#batchSearchDms").kendoButton({      // 승인
        enable:true,
        click:function(e){
            batch();
        }
    });
    
    function iGetInnerText(testStr) {
        var resultStr = testStr.replace(/\ +/g, ""); //去掉空格
        resultStr = testStr.replace(/[ ]/g, "");    //去掉空格
        resultStr = testStr.replace(/[\r\n]/g, ""); //去掉回车换行
        return resultStr;
    }

    //승인 , 불승인
    collect = function(){
        var vo = [], param = {}, saveUrl = "", isReqStatCd = "";
        var sModelCd = $("#sModelCd").val().replace(/-/gi, "");
        
       	param = {checkMonth:sModelCd};
       	if(sModelCd==null||sModelCd==undefined||sModelCd==""){
       		dms.notification.warning("<spring:message code='sal.info.modification'/>");
           	return;
        }
       	$("#batchSearchDcsOrder").data("kendoButton").enable(false);
       	saveUrl = "<c:url value='/sal/ctl/oneShotControl/callDmsSalesOrderCheck.do' />";

        console.log("saveUrl==",saveUrl);
        dms.window.confirm({
        	 message:"<spring:message code='global.lbl.confirmYn'/>"
            ,title :"<spring:message code='sal.lbl.finalConfQty' />"
            ,callback:function(result){
                if(result){
                	dms.loading.show();
                	$.ajax({
                        url:saveUrl,
                        data:JSON.stringify(param),
                        type:'POST',
                        dataType:'json',
                        contentType:'application/json',
                        error:function(jqXHR,status,error) {
                        	dms.loading.hide();
                            dms.notification.error(jqXHR.responseJSON.errors);
                        },
                        success:function(jqXHR, textStatus) {
                        	dms.loading.hide();
                            $("#grid").data("kendoExtGrid").dataSource.read();
                            $("#batchSearchDcsOrder").data("kendoButton").enable(true);
                            dms.notification.success("<spring:message code='global.info.success'/>");
                        }
                    });
                }else{
                	$("#batchSearchDcsOrder").data("kendoButton").enable(true);
                    return false;
                }
            }
        });
    }
    
  //승인 , 불승인
    batch = function(){
        var vo = [], param = {}, saveUrl = "", isReqStatCd = "";
        var sModelCd = $("#sModelCd").val().replace(/-/gi, "");
        
        var sDlrCd = iGetInnerText($("#sDlrCd").val());
        
        if(sDlrCd!=null&&sDlrCd!=undefined&&sDlrCd!=""){
        	
			if(sDlrCd.length<5){
				dms.notification.error("所输入的经销商格式不正确");
				return;
			}
			if(sDlrCd.length%5>0){
				dms.notification.error("所输入的经销商格式不正确");
				return;
			}
        }
        
       	param = {dlrCd:sDlrCd,checkMonth:sModelCd};
       	if(sModelCd==null||sModelCd==undefined||sModelCd==""){
       		dms.notification.warning("<spring:message code='sal.info.modification'/>");
           	return;
           }
       	$("#batchSearchDms").data("kendoButton").enable(false);
       	
       	saveUrl = "<c:url value='/sal/ctl/oneShotControl/searchOrderInfoErpToDmsByThread.do' />";

        console.log("saveUrl==",saveUrl);
        dms.window.confirm({
        	 message:"<spring:message code='global.lbl.confirmYn'/>"
            ,title :"<spring:message code='sal.lbl.finalConfQty' />"
            ,callback:function(result){
                if(result){
                	//dms.loading.show();
                	
               		timerId = window.setInterval("inquiryLog()", 5000);
               		document.getElementById("hasCheck").value = "0";
               		document.getElementById("allCheck").value = "0";
               		console.log("开始查询执行进度");
                	$.ajax({
                        url:saveUrl,
                        data:JSON.stringify(param),
                        type:'POST',
                        dataType:'json',
                        contentType:'application/json',
                        error:function(jqXHR,status,error) {
                        	dms.loading.hide();
                            dms.notification.error(jqXHR.responseJSON.errors);
                        },
                        success:function(jqXHR, textStatus) {
                        	//dms.loading.hide();
                            $("#grid").data("kendoExtGrid").dataSource.read();
                            $("#batchSearchDms").data("kendoButton").enable(true);
                            //dms.notification.success("<spring:message code='global.info.success'/>");
                        }
                    });
                }else{
                	$("#batchSearchDms").data("kendoButton").enable(true);
                    return false;
                }
            }
        });
    }
  
    inquiryLog = function(){
		var param = {};
		var sModelCd = $("#sModelCd").val().replace(/-/gi, "");
		param = {checkMonth:sModelCd};
    	$.ajax({
            url:"<c:url value='/sal/ctl/oneShotControl/checkOrderProcessShow.do' />",
            data:JSON.stringify(param),
            type:'POST',
            dataType:'json',
            contentType:'application/json',
            async:false,
            error:function(jqXHR,status,error) {
                dms.notification.error(jqXHR.responseJSON.errors);
            },
            success:function(jqXHR, textStatus) {
            	if(textStatus=="success"){
            		var checkObj = JSON.parse(jqXHR);
            		if(checkObj.allCheck==0||checkObj.hasCheck == checkObj.allCheck){
            			console.log("停止循环==");
            			alert("执行完毕");
            			window.clearInterval(timerId);
	                    timerId = null;
	            	}
	            	document.getElementById("hasCheck").value = checkObj.hasCheck;
	           		document.getElementById("allCheck").value = checkObj.allCheck;
	                //$("#grid").data("kendoExtGrid").dataSource.page(1);
            	}
            }
        });
    }

    // 메인 그리드
    $("#grid").kendoExtGrid({
        gridId:"G-SAL-0626-195909"
        ,dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/sal/ctl/oneShotControl/selectDmsOrderDiff.do' />"
                },
                parameterMap:function(options, operation) {
                    if (operation === "read") {
                    	var sModelCd = $("#sModelCd").val().replace(/-/gi, "");
                        var params = {};

                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;
                        params["checkMonth"] = sModelCd;

                        return kendo.stringify(params);

                    }else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,schema:{
                model:{
                    id:"tatics",
                    fields:{
	                     rnum        	:{type:"int"}            
	                    ,dlrCd         	:{type:"string"}           
	                    ,erpOrderNotmatch     :{type:"int"}         
	                    ,erpOrderMatch       :{type:"int"}          
	                    ,dcsOrderNotmatch     :{type:"int"}         
	                    ,dcsOrderMatch       :{type:"int"}         
	                    ,totalDiff     :{type:"int"}         
                    }
                }
            }
            ,requestEnd:function(e){if(e.type =="read"){$(".checkAll").prop("checked", false);}}
        }
        ,change:function(e) {

            var that = this;
            var rows = this.select();
            $.each(rows, function(idx, row){
                if(that.dataItem(row).strStat != "A"){
                    that.clearSelection(row);
                }
            });

         }
         ,dataBound:function(e) {

            var rows = e.sender.tbody.children();
            $.each(rows, function(idx, row){
                var dataItem = e.sender.dataItem(row);

                if(dataItem.strStat != "A"){
                    $(row).css("background-color", "#E0E0E0");
                    $(".grid-checkbox-item", row).each(function(){
                        $(this).prop("disabled", true);
                    });
                }
            });
        }
       ,multiSelectWithCheckbox:false
       ,editable:false
       ,pageable:true
       ,autoBind:false
       ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
       ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
       ,columns:[
           //{field:"rnum", title:"<spring:message code='sal.lbl.numberSeq' />", width:40, attributes:{"class":"ac"}}//行号
          {field:"dlrCd", title:"<spring:message code='global.lbl.dlrCd' />", width:50, attributes:{"class":"ac"}} 
          ,{field:"erpOrderNotmatch", title:"<spring:message code='sal.title.sapUndistributed' />", width:40, attributes:{"class":"ac"}}                                      
          ,{field:"erpOrderMatch", title:"<spring:message code='sal.title.sapAllocated' />", width:40, attributes:{"class":"ac"}}                                          
          ,{field:"dmsOrderNotmatch", title:"<spring:message code='sal.title.dmsUndistributed' />", width:40, attributes:{"class":"ac"}}                                        
          ,{field:"dmsOrderMatch", title:"<spring:message code='sal.title.dmsAllocated' />", width:40, attributes:{"class":"ac"}} 
          ,{field:"totalDiff", title:"<spring:message code='par.lbl.gapQty' />", width:40, attributes:{"class":"ac"}} 
          ,{field:"checkResult", title:"<spring:message code='global.lbl.procRsltCont' />", width:40, attributes:{"class":"ac"}} 
          //,{field:"checkMessage", title:"<spring:message code='global.lbl.budgetDetlCont' />", width:40, attributes:{"class":"ac"}} 
       ]
   });

    function checkBtn(){
        var isReqStatCd = "";
        var grid = $("#grid").data("kendoExtGrid");
        var rows = grid.select();

        rows.each(function(index, row) {
            var row = grid.dataItem(row);

            if( dms.string.strNvl(row.strStat) != "A"){
                isReqStatCd = dms.string.strNvl(row.strStat);
            }
        });

        if(dms.string.isNotEmpty(isReqStatCd)){
            $("#batchSearchDms").data("kendoButton").enable(false);
        }else{
            $("#batchSearchDms").data("kendoButton").enable(true);
        }
    }
    
});
</script>
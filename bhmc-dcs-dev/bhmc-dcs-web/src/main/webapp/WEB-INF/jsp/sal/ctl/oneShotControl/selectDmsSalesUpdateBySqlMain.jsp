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
            <%-- <button id="batchUpdateDmsOrder" class="btn_m">批量修复订单差异</button> --%>        <!-- 批量修复订单差异 -->
            <button id="batchInsertDealerForUpdate" class="btn_m">初始化待执行经销商</button>        <!-- 初始化经销商数据 -->
            <button id="batchUpdateBySql" class="btn_m"><spring:message code='sal.btn.ExecuteSQL' /></button>        <!-- 执行sql -->
            <%-- <button id="updateDcsBySql"  class="btn_m btn_modify"><spring:message code='sal.btn.ExecuteSQL' /></button> --%><!-- 执行sql -->
            <button id="btnSearch" class="btn_m btn_search"><spring:message code='global.btn.search' /></button><!-- 查询 -->
            <%-- <button id="btnExcelExport" class="btn_m btn_excel"><spring:message code='sal.lbl.excelDownload' /></button> --%><!-- 下载 -->
            <%-- <button id="help"  class="btn_m btn_link"><spring:message code='sal.btn.help' /></button> --%>         <!-- 帮助 -->
        </div>
    </div>
    <div class="table_form form_width_70per" role="search" data-btnid="btnSearch">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:5%;">
                <col style="width:10%;">
                <col style="width:5%;">
                <col style="width:5%;">
                <col style="width:5%;">
                <col style="width:60%;">
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><spring:message code='global.lbl.pgssRate' /></th>  <!-- 사업부 -->
                    <td>
                        <input id="hasUpdate" type="text" size="4"/>/<input id="allUpdate" type="text" size="4"/>
                    </td>
                    <th scope="row">执行经销商</th>  <!-- 사업부 -->
                    <td>
                        <textarea data-name="sDlrCd"  rows="4" cols="15" id="sDlrCd" name="sDlrCd" style="height: 400px;" class="form_textarea" data-json-obj="true"></textarea>
                    </td>
                    <th scope="row">SQL</th>  <!-- 사업부 -->
                    <td>
                        <textarea data-name="SQL"  rows="4" cols="160" id="sqlForUpdate" name="sqlForUpdate" style="height: 400px;" class="form_textarea" data-json-obj="true"></textarea>
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
console.log("checkMonth==",checkMonth);
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
	
	$("#batchInsertDealerForUpdate").kendoButton({      // 승인
        enable:true,
        click:function(e){
        	collect();
        }
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
                ,"templateFile":"NumberContrast.xlsx"
                ,"fileName":"NumberContrast.xlsx"
                ,"sModelCd":'NUMBER'
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
    
    $("#batchUpdateBySql").kendoButton({      // 승인
        enable:true,
        click:function(e){
            batchUpdateBySql();
        }
    });
    
    function iGetInnerText(testStr) {
        var resultStr = testStr.replace(/\ +/g, ""); //去掉空格
        resultStr = testStr.replace(/[ ]/g, "");    //去掉空格
        resultStr = testStr.replace(/[\r\n]/g, ""); //去掉回车换行
        return resultStr;
    }
    
    collect = function(){
        var vo = [], param = {}, saveUrl = "", isReqStatCd = "";
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
        
        param = {dlrCd:sDlrCd};
        
       	/*if(sDlrCd==null||sDlrCd==undefined||sDlrCd==""){
       		dms.notification.warning("<spring:message code='sal.info.modification'/>");
           	return;
        }*/
       	$("#batchInsertDealerForUpdate").data("kendoButton").enable(false);
       	saveUrl = "<c:url value='/sal/ctl/oneShotControl/batchInsertDealerForUpdate.do' />";

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
                            $("#batchInsertDealerForUpdate").data("kendoButton").enable(true);
                            dms.notification.success("<spring:message code='global.info.success'/>");
                        }
                    });
                }else{
                	$("#batchInsertDealerForUpdate").data("kendoButton").enable(true);
                    return false;
                }
            }
        });
    }
    
  //승인 , 불승인
    batchUpdateBySql = function(){
        var vo = [], param = {}, saveUrl = "", isReqStatCd = "";
        var sDlrCd = iGetInnerText($("#sDlrCd").val());
        var sqlForUpdate = $("#sqlForUpdate").val();
        
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
        
        console.log(sqlForUpdate);
        if(sqlForUpdate==null||sqlForUpdate==undefined||sqlForUpdate==""){
        	dms.notification.error("请输入SQL再执行");
			return;
        }
        
        param = {dlrCd:sDlrCd,sql:sqlForUpdate};
       	$("#batchUpdateBySql").data("kendoButton").enable(false);
       	
       	saveUrl = "<c:url value='/sal/ctl/oneShotControl/updateBySqlByThread.do' />";

        dms.window.confirm({
        	 message:"<spring:message code='global.lbl.confirmYn'/>"
            ,title :"<spring:message code='sal.lbl.finalConfQty' />"
            ,callback:function(result){
                if(result){
                	//dms.loading.show();
                	
               		timerId = window.setInterval("inquiryLog()", 5000);
               		document.getElementById("hasUpdate").value = "0";
               		document.getElementById("allUpdate").value = "0";
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
                        	dms.loading.hide();
                            $("#grid").data("kendoExtGrid").dataSource.read();
                            $("#batchUpdateBySql").data("kendoButton").enable(true);
                            dms.notification.success("<spring:message code='global.info.success'/>");
                        }
                    });
                }else{
                	$("#batchUpdateBySql").data("kendoButton").enable(true);
                    return false;
                }
            }
        });
    }
  
    inquiryLog = function(){
		console.log("inquiryLog in");
		var param = {};
    	$.ajax({
            url:"<c:url value='/sal/ctl/oneShotControl/batchUpdateBySqlProcessShow.do' />",
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
            		console.log("checkObj==",checkObj);
            		if(checkObj.allUpdate>0&&checkObj.hasUpdate == checkObj.allUpdate){
            			console.log("停止循环==");
            			window.clearInterval(timerId);
	                    timerId = null;
	            	}
	            	document.getElementById("hasUpdate").value = checkObj.hasUpdate;
	           		document.getElementById("allUpdate").value = checkObj.allUpdate;
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
                    url:"<c:url value='/sal/ctl/oneShotControl/selectDmsUpdateResult.do' />"
                },
                parameterMap:function(options, operation) {
                    if (operation === "read") {
                        var params = {};

                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

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
	                    ,updateResult         	:{type:"string"}           
	                    ,updateMessage         	:{type:"string"}           
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
          // {field:"rnum", title:"<spring:message code='sal.lbl.numberSeq' />", width:40, attributes:{"class":"ac"}}//行号
          {field:"dlrCd", title:"<spring:message code='global.lbl.dlrCd' />", width:50, attributes:{"class":"ac"}} 
          ,{field:"updateResult", title:"<spring:message code='global.lbl.procRsltCont' />", width:40, attributes:{"class":"ac"}} 
          ,{field:"updateMessage", title:"<spring:message code='global.lbl.budgetDetlCont' />", width:40, attributes:{"class":"ac"}} 
       ]
   });
});
</script>
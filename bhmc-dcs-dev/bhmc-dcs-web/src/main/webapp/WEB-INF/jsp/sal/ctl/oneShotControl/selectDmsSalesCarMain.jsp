<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<dms:configValue code='dateFormat' var="_dateFormat" />
<dms:configValue code='dateTimeFormat' var="_dateTimeFormat" />

<div id="resizableContainer">
<section class="group">
    <div class="header_area">
        <h1 class="title_basic"><spring:message code='ser.title.carInfo' /><spring:message code='global.lbl.update' /></h1>
        <div class="btn_right">
            <button id="outGoing"  class="btn_m"><spring:message code='sal.btn.back' /></button>        
            <button id="back" class="btn_m btn_modify"><spring:message code='sal.btn.ExecuteSQL' /></button>      
            <button id="btnSearch" class="btn_m btn_search"><spring:message code='global.btn.search' /></button>
            <button id="btnExcelExport" class="btn_m btn_excel"><spring:message code='sal.lbl.excelDownload' /></button>
            <button id="help"  class="btn_m btn_link"><spring:message code='sal.btn.help' /></button>         <!-- 帮助 -->
        </div>
    </div>
    <div class="table_form form_width_70per" role="search" data-btnid="btnSearch">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:10%;">
                <col style="width:20%;">
                <col style="width:5%;">
                <col style="width:15%;">
                <col style="width:5%;">
                <col style="width:40%;">
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><spring:message code='sal.lbl.date' /></th>  <!-- 日期 -->
                     <td>
                        <div class="form_float">
                            <div class="date_left">
                                <input id="applStartDt" class="form_datepicker">
                                <span class="txt_from">~</span>
                            </div>
                            <div class="date_right">
                                <input id="applEndDt" class="form_datepicker">
                            </div>
                        </div>
                    </td>
                    <th scope="row"><spring:message code='global.lbl.dlrCd' /></th> <!-- 经销商代码 -->
                    <td>
                        <textarea data-name="sDlrCd" rows="4" cols="" id="sDlrCd" name="sDlrCd" class="form_textarea" data-json-obj="true"></textarea>
                    </td>
                     <th scope="row">SQL</th>  
                    <td>
                        <textarea data-name="SQL" rows="4" cols="" id="sqlForUpdate" name="sqlForUpdate" class="form_textarea" data-json-obj="true"></textarea>
                    </td>
                </tr>
                <tr>
                	<th ><spring:message code='sal.info.conFailed'/></th>  <!-- 사업부 -->
                    <td>
                        <textarea readonly rows="3" style="width:1141px;background:#CCCCCC" id="dlrCdError" name="dlrCdError" class="form_textarea" data-json-obj="true"></textarea>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>

    <div class="table_grid mt10">
        <h1 class="title_basic"><spring:message code='sal.title.carDifferences' /></h1>
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
	                        	<span  style="color:red">1.选择时间范围,执行差异对比,找出存在差异的数据信息。</span>
	                        </td>
                        </tr>
                        <tr>
	                        <td>
	                        	<span  style="color:red">2.执行sql需填写经销商代码和执行的sql(经销商代码可写'all'不区分大小写,所有经销商执行该sql)。</span>
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

var toDay = "${toDay}";         //현재일자
var yesDay = "${yesDay}";       // 해당월 1일

console.log("toDay==",toDay);
console.log("yesDay==",yesDay);


//사업부
var divisionCdDs = [];
divisionCdDs.push({"optionCd":yesDay, "optionNm":yesDay});
divisionCdDs.push({"optionCd":toDay, "optionNm":toDay});
var divisionCdArr = dms.data.arrayToMap(divisionCdDs, function(obj){return obj.optionCd});

console.log("toDay==",toDay);

$(document).ready(function() {

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
                ,"templateFile":"SalesCar.xlsx"
                ,"fileName":"SalesCar.xlsx"
                ,"sModelCd":"DMSCAR"
                ,"sDlrCd" : $("#sDlrCd").val()
             	,"applStartDt" : $("#applStartDt").val().replace(/-/gi, "")
            	,"applEndDt" : $("#applEndDt").val().replace(/-/gi, "")
            });
        }
    });

    $("#back").kendoButton({      //执行sql
        enable:true,
        click:function(e){
            confirm('BACK');
        }
    });

    $("#outGoing").kendoButton({   //差异对比
        enable:true,
        click:function(e){
            confirm('OUT');
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
    
	fnChkSearchDate = function(e){
	  	  if(dms.string.isEmpty(e.data.from.val())){return;}
	  	  if(dms.string.isEmpty(e.data.to.val())){return;}

	  	  var startDt = e.data.from.data("kendoExtMaskedDatePicker").value();
	  	  var endDt = e.data.to.data("kendoExtMaskedDatePicker").value();
	  	  if(startDt > endDt){
	  	      dms.notification.warning("<spring:message code='global.err.checkDateValue' />");
	  	      $(this).data("kendoExtMaskedDatePicker").value(new Date(''));
	  	      $(this).focus();
	  	  }
	  	}
	
	$("#applStartDt").kendoExtMaskedDatePicker({
		/* start: "year"
		,depth:"year"
	    , */
	    format :"yyyy-MM-dd"
	    ,dateValidMessage :"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
	});
	$("#applEndDt").kendoExtMaskedDatePicker({
	    format :"yyyy-MM-dd"
	    ,dateValidMessage :"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
	});
	
    $("#applStartDt").on('change', {from:$("#applStartDt"), to:$("#applEndDt")}, fnChkSearchDate);
	$("#applEndDt").on('change', {from:$("#applStartDt"), to:$("#applEndDt")}, fnChkSearchDate);
	
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
	
    confirm = function(appr){
        var vo = [], param = {}, saveUrl = "", isReqStatCd = "";
        var sModelCd = ""; 
        var VIN = ""; 
        var sDlrCd = $("#sDlrCd").val();//经销商代码
        var sql = $("#sqlForUpdate").val();//sql
        var dateStart = $("#applStartDt").val().replace(/-/gi, "");//开始时间
        var dateEnd = $("#applEndDt").val().replace(/-/gi, "");//结束时间
        
        var grid = $("#grid").data("kendoExtGrid");
        var rows = grid.select();
        var item = grid.dataItem(rows);
        
        if(appr == 'BACK'){//执行sql
        	param = {sVinNo1:sDlrCd,sVinNo2:sql};
        	if(sql==null||sql==undefined||sql==""){
        		dms.notification.warning("<spring:message code='sal.info.update'/>");
            	return;
            }
        	if(sDlrCd==null||sDlrCd==undefined||sDlrCd==""){
        		dms.notification.warning("<spring:message code='sal.info.dealerCode'/>");
            	return;
            }
        	$("#back").data("kendoButton").enable(false);
        	saveUrl = "<c:url value='/sal/ctl/oneShotControl/updateDmsCarBySql.do' />";
        	
        }else{//差异对比
        	param = {sVinNo1:dateStart,sVinNo2:dateEnd};
        	if(dateStart==null||dateStart==undefined||dateStart==""||dateEnd==null||dateEnd==undefined||dateEnd==""){
        		dms.notification.warning("<spring:message code='sal.info.modification'/>");
            	return;
            }
        
        	$("#outGoing").data("kendoButton").enable(false);
        	saveUrl = "<c:url value='/sal/ctl/oneShotControl/updateDmsCar.do' />";
        }
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
                $("#outGoing").data("kendoButton").enable(true);
                $("#back").data("kendoButton").enable(true);
                if(jqXHR != "0"){
             		$("#dlrCdError").val(jqXHR);
             	}
                dms.notification.success("<spring:message code='global.info.success'/>");
            }
        });
    }

    // 列表
    $("#grid").kendoExtGrid({
        gridId:"G-SAL-0327-183016"
        ,dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/sal/ctl/oneShotControl/selectDmsSalesCar.do' />"
                },
                parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};
                        var applStartDt = "";
                        var applEndDt = "";
                        var sDlrCd = "";

                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        params["sDlrCd"] = $("#sDlrCd").val();
                        /* params["sVinNo1"] = $("#applStartDt").val().replace(/-/gi, "");
                        params["sVinNo2"] = $("#applEndDt").val().replace(/-/gi, ""); */

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
                     rownum        :{type:"string"}            
                    ,vinNo         :{type:"string"}            
                    ,dlrCd         :{type:"string"}            
                    ,statCd        :{type:"string"}          
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
       ,multiSelectWithCheckbox:true
       ,editable:false
       ,pageable:true
       ,autoBind:false
       ,selectable:"row"
       ,indvColumnVisible:true          
       ,indvColumnReorderable:true       
       ,columns:[
           {field:"rnum"       , title:"<spring:message code='sal.lbl.numberSeq' />", width:30, attributes:{"class":"ac"}}//行号
          ,{field:"vinNo", title:"<spring:message code='global.lbl.vinNo' />", width:50, attributes:{"class":"ac"}}                                      // 经销商代码
          ,{field:"dlrCd", title:"<spring:message code='global.lbl.dlrCd' />", width:80, attributes:{"class":"ac"}}                                       // 销售订单
          ,{field:"statCd", title:"<spring:message code='global.lbl.vinSts' />", width:80, attributes:{"class":"ac"}}                                          // 状态
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
            $("#back").data("kendoButton").enable(false);
            $("#updateDcsBySql").data("kendoButton").enable(false);
        }else{
            $("#back").data("kendoButton").enable(true);
            $("#updateDcsBySql").data("kendoButton").enable(true);
        }
    }

});
</script>
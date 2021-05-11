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
            <button id="batchUpdateDms" class="btn_m"><spring:message code='sal.btn.back' /></button>        <!-- 승인 -->
            <%-- <button id="batchUpdateDms" class="btn_m"><spring:message code='sal.btn.stockStateAllChange' /></button> --%> 
            <button id="updateDmsBySql"  class="btn_m btn_modify"><spring:message code='sal.btn.ExecuteSQL' /></button>         <!-- 거절 -->
            <button id="btnSearch" class="btn_m btn_search"><spring:message code='global.btn.search' /></button><!-- 조회 -->
            <button id="btnExcelExport" class="btn_m btn_excel"><spring:message code='sal.lbl.excelDownload' /></button><!-- 조회 -->
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
                    <th scope="row"><spring:message code='sal.lbl.date' /></th>  <!-- 사업부 -->
                    <td>
                     <div class="form_float">
                            <div class="date_left">
                                <input id="sModelCd" class="form_datepicker">
                            </div>
                     </div>
                    </td>
                    <th scope="row"><spring:message code='global.lbl.dlrCd' /></th> <!-- 딜러코드 -->
                    <td>
                        <textarea data-name="sDlrCd" rows="4" cols="" id="sDlrCd" name="sDlrCd" class="form_textarea" data-json-obj="true"></textarea>
                    </td>
                    <th scope="row">SQL</th>  <!-- 사업부 -->
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
	                        	<span  style="color:red">2.执行sql需填写经销商代码,日期和执行的sql(经销商代码可写'all'不区分大小写,所有经销商执行该sql)。</span>
	                        </td>
                        </tr>
                        <tr>
	                        <td>
	                        	<span  style="color:red">3.查询按钮,将完成差异对比的数据展示在前台页面(查询条件根据日期和经销商代码过滤)。</span>
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
                ,"templateFile":"SalesOrderUpdateResult_Tpl.xlsx"
                ,"fileName":"ExcelDownDms.xlsx"
                ,"sModelCd":'DMS'
                ,"sDlrCd":$("#sDlrCd").val()
                ,"aldy":$("#sModelCd").val().replace(/-/gi, "")
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
    
    $("#batchUpdateDms").kendoButton({      // 승인
        enable:true,
        click:function(e){
            confirm('BATCH');
        }
    });

    $("#updateDmsBySql").kendoButton({   // 삭제:불승인
        enable:true,
        click:function(e){
            confirm('ONEDEALER');
        }
    });

    //승인 , 불승인
    confirm = function(appr){
        var vo = [], param = {}, saveUrl = "", isReqStatCd = "";
        var sqlForUpdate = $("#sqlForUpdate").val();
        var sModelCd = $("#sModelCd").val().replace(/-/gi, "")
        var sDlrCd = $("#sDlrCd").val();
        console.log("sqlForUpdate==",sqlForUpdate);
        
        if(appr == 'BATCH'){
        	param = {sModelCd:sModelCd};
        	if(sModelCd==null||sModelCd==undefined||sModelCd==""){
        		dms.notification.warning("<spring:message code='sal.info.modification'/>");
            	return;
            }
        	
            $("#batchUpdateDms").data("kendoButton").enable(false);
        	saveUrl = "<c:url value='/sal/ctl/oneShotControl/updateOrderInfoErpToDms.do' />";
        }else{
        	param = {sCarlineCd:sqlForUpdate,sModelCd:sModelCd,sDlrCd:sDlrCd};
        	if(sqlForUpdate==null||sqlForUpdate==undefined||sqlForUpdate==""){
        		dms.notification.warning("<spring:message code='sal.info.update'/>");
            	return;
            }
        	if(sDlrCd==null||sDlrCd==undefined||sDlrCd==""){
        		dms.notification.warning("<spring:message code='sal.info.dealerCode'/>");
            	return;
            }
        	if(sModelCd==null||sModelCd==undefined||sModelCd==""){
        		dms.notification.warning("<spring:message code='sal.info.modification'/>");
            	return;
            }
        	$("#updateDmsBySql").data("kendoButton").enable(false);
        	saveUrl = "<c:url value='/sal/ctl/oneShotControl/updateDmsOrderBySql.do' />";
        }

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
                             $("#updateDmsBySql").data("kendoButton").enable(true);
                             $("#batchUpdateDms").data("kendoButton").enable(true);
                         	if(jqXHR != "0"){
                         		$("#dlrCdError").val(jqXHR);
                         	}
                            dms.notification.success("<spring:message code='global.info.success'/>");
                         }
                     });
                }else{
                	document.getElementById("batchUpdateDms").disabled = false;
                    return false;
                }
            }
        });
       
    }

    // 메인 그리드
    $("#grid").kendoExtGrid({
        gridId:"G-SAL-0327-135901"
        ,dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/sal/ctl/oneShotControl/selectDmsSalesMonth.do' />"
                },
                parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};
                        var sModelCd = "";
                        var sFscCd = "";

                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        params["sModelCd"] = $("#sModelCd").val().replace(/-/gi, "");
                        params["sDlrCd"] = $("#sDlrCd").val();

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
                     rownum        :{type:"string"}            //
                    ,carlineCd         :{type:"string"}            //DLR_CD
                    ,salesNo       :{type:"string"}            //SALES_NO
                    ,modelCd          :{type:"string"}            //PRTY
                   // ,aldy          :{type:"string"}            //ALDY
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
       ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
       ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
       ,columns:[
           {field:"rnum"       , title:"<spring:message code='sal.lbl.numberSeq' />", width:40, attributes:{"class":"ac"}}//行号
          ,{field:"carlineCd", title:"<spring:message code='global.lbl.dlrCd' />", width:50, attributes:{"class":"ac"}}                                      // 经销商代码
          ,{field:"salesNo", title:"<spring:message code='global.lbl.ordNo' />", width:80, attributes:{"class":"al"}}                                       // 销售订单
          ,{field:"modelCd", title:"<spring:message code='sal.lbl.ordStat' />", width:80, attributes:{"class":"al"}}                                          // 状态
          //,{field:"aldy", title:"<spring:message code='sal.lbl.dlrNm' />", width:140, attributes:{"class":"ac"}}                                         // vin
          //,{field:"reqDt", title:"<spring:message code='global.lbl.fincReqDt' />", width:80, attributes:{"class":"ac"}, format:"{0:"+vDtyyyyMMdd+"}"}  //
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
            $("#batchUpdateDms").data("kendoButton").enable(false);
            $("#updateDcsBySql").data("kendoButton").enable(false);
        }else{
            $("#batchUpdateDms").data("kendoButton").enable(true);
            $("#updateDcsBySql").data("kendoButton").enable(true);
        }
    }

});
</script>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<section class="group">
    <div class="header_area">
        <h1 class="title_basic"><spring:message code="ser.title.claimInvoiceRemittance" /></h1>
        <div class="btn_right">
        	<dms:access viewId="VIEW-I-13276" hasPermission="${dms:getPermissionMask('READ')}">
            	<button type="button" id="btnCtlSearch" class="btn_m btn_search btnStep08 btnStep09"><spring:message code="global.btn.search" /><!-- 查询 --></button>
           	</dms:access>
            <dms:access viewId="VIEW-I-13278" hasPermission="${dms:getPermissionMask('READ')}">
            	<button type="button" id="btnExcelImport" class="btn_m"><spring:message code="ser.btn.batchImport" /><!-- 批量导入 --></button>
           	</dms:access>
            <dms:access viewId="VIEW-I-13277" hasPermission="${dms:getPermissionMask('READ')}">
            	<button type="button" class="btn_m" id="btnExcelExport"><spring:message code="global.btn.excelExport" /><!-- 导出Excel --></button>
            </dms:access>
        </div>
    </div>
    <div class="table_form form_width_100per" role="search" data-btnid="btnCtlSearch">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width: 10%;">
                <col style="width: 15%;">
                <col style="width: 10%;">
                <col style="width: 15%;">
                <col style="width: 10%;">
                <col style="width: 15%;">
                <col style="width: 25%;">
                <col>
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><spring:message code="global.lbl.dlrCd" /><!-- 经销商代码 --></th>
                    <td><input id="sDlrCd" name="sDiviCd" class="form_input" /></td>
                    <th scope="row"><spring:message code="global.lbl.dlrNm" /><!-- 经销商名称 --></th>
                    <td><input id="sDlrNm" name="sOffCd" class="form_input" /></td>
                    <th scope="row"><spring:message code="ser.lbl.remittanceStatus" /><!-- 汇款状态 --></th>
                    <td><input id="sPaymTp" name="sPaymTp" class=form_comboBox /></td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code="ser.lbl.settlementStatementNo" /><!-- 结算报表编号 --></th>
                    <td><input id="sInvcNo" name="sDiviCd" class="form_input" /></td>
                    <th scope="row"><spring:message code="ser.lbl.invcDt" /><!-- 结算报表年月 --></th>
                    <td>
                    	<div class="form_float">
                            <div class="date_left">
                                <input id="sInvcDtStart" value="" class="form_datepicker ac">
                                <span class="txt_from">~</span>
                            </div>
                            <div class="date_right">
                                <input id="sInvcDtEnd" value="" class="form_datepicker ac">
                            </div>
                        </div>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
</section>
<section class="group">
    <div class="header_area">
        <h2 class="title_basic"><spring:message code="ser.title.listOfRemittanceOrders" /><!-- 汇款单列表 --></h2>
        <div class="btn_right">
        	<dms:access viewId="VIEW-I-13279" hasPermission="${dms:getPermissionMask('READ')}">
            	<button type="button" id="remittanceBtn" class="btn_m btn_Select"><spring:message code='ser.btn.remittance' /><!-- 汇款 --></button>
            </dms:access>
        </div>
    </div>
    <div class="table_grid">
    	<div id="mainGrid" class="resizable_grid"></div>
    </div>
</section>
<section class="group">
    <div class="header_area">
        <h2 class="title_basic"><spring:message code="ser.title.InvoiceClaimInfo" /><!-- 发票信息 --></h2>
    </div>
    <div class="table_grid">
    	<div id="receiptGrid" class="resizable_grid"></div>
    </div>
</section>

<script type="text/javascript">
var paymTpList = [];
<c:forEach var="obj" items="${paymTpList}"> // 获取汇款状态列表信息
    paymTpList.push({"paymTp":"${obj.cmmCd}", "paymTpNm":"${obj.cmmCdNm}"});
</c:forEach>

var gridRow;

$(document).ready(function() {
	
	// 汇款状态查询条件下拉框
    var sPaymTp = $("#sPaymTp").kendoExtDropDownList({
        dataTextField:"paymTpNm" ,
        dataValueField:"paymTp",
        dataSource: paymTpList,
        optionLabel:" ",
        filter:"contains",
    });
    
	// 结算报表日期起始
    $("#sInvcDtStart").kendoExtMaskedDatePicker({
        format:"yyyy-MM"
        ,dateValidMessage:"<spring:message code='ser.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,value:"${sFromDt}"
        ,depth:"year"
        ,start:"year"
	});
	
 	// 结算报表日期结束
    $("#sInvcDtEnd").kendoExtMaskedDatePicker({
        format:"yyyy-MM"
        ,dateValidMessage:"<spring:message code='ser.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,value:"${sFromDt}"
        ,depth:"year"
        ,start:"year"
	});
	
	// 汇款按钮
    $("#remittanceBtn").kendoButton({
       click:function(e) {
    	   var grid = $("#mainGrid").data("kendoExtGrid");
           var dataItem = grid.dataItem(grid.select());
           if (dataItem == null) {
               // 提示没有变更信息.
               dms.notification.info("<spring:message code='global.info.required.change'/>");
               return;
           }
           if (dataItem.paymTp != '01'){
        		// 提示汇款状态不符合汇款条件
               dms.notification.info("<spring:message code='ser.error.remittanceStatusMustBeNotRemitted' />");
               return;
           }
           var params = {};
           params["invcNo"] = dataItem.invcNo;
           params["dlrCd"] = dataItem.dlrCd;

           $.ajax({
               url:"<c:url value='/ser/wac/claimInvoice/updateClaimInvoiceRemittance.do'/>",
                data:JSON.stringify(params),
                type:'POST',
                dataType:'json',
                contentType:'application/json',
                error:function(jqXHR,status,error) {
                    dms.notification.error(jqXHR.responseJSON.errors);
                },
                success:function(jqXHR, textStatus) {
                    grid.dataSource._destroyed = [];
                    grid.dataSource.page(1);
                    if (jqXHR > 0){
                        // 操作成功.
                        dms.notification.success("<spring:message code='global.info.success'/>");
                    }else if (jqXHR == -1){
                    	// 汇款单已汇款
                        dms.notification.info("<spring:message code='ser.error.pleaseDoNotRepeatTheOperation' />");
                    }else {
                    	// 操作失败
                        dms.notification.info("<spring:message code='par.info.cnfmModifyChkMsg'/>");
                    }
                }
            });
     	}
    });
	
	// 查询按钮
	$("#btnCtlSearch").kendoButton({
	    click:function(e) {
	    	gridRow = "" // 清楚汇款单列表选中标记
            $("#receiptGrid").data("kendoExtGrid").dataSource.data([]); // 清空发票信息列表数据
	    	$('#mainGrid').data('kendoExtGrid').dataSource.page(1); // 查询汇款单列表信息
     	}
    });
	
	// 汇款单查询
	$("#mainGrid").kendoExtGrid({
		gridId: "",
		dataSource: {
			transport: {
				read: { 
					url: "<c:url value='/ser/wac/claimInvoice/findClaimInvoiceRemittance.do' />" // 查询汇款单信息
				},
				parameterMap: function(options, operation){
					if (operation === "read"){
						var params = {};
						
						params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;
                        
                        params["dlrCd"] = $("#sDlrCd").val();
                        params["dlrNm"] = $("#sDlrNm").val();
                        params["invcNo"] = $("#sInvcNo").val();
                        params["paymTp"] = $("#sPaymTp").val();
                       	params["invcDtStart"] = $("#sInvcDtStart").val();
                       	params["invcDtEnd"] = $("#sInvcDtEnd").val();
                        return kendo.stringify(params);
					}else if (operation !== "read" && options.models){
						return kendo.stringify(options.models);
					}
				}
			},
			schema: {
				errors: "error",
				data: "data",
				total: "total",
				model: {
					id: "order",
					fields: { 
						rnum: {type:"number"},
						dlrCd: {type: "string"},
						dlrNm: {type: "string"},
						invcNo: {type: "string"},
						paymTp: {type: "string"},
						paymDt: {type: "date"},
						invcDt: {type: "date"},
						confirmTotAmt: {type: "number"},
						ddctTotAmt: {type: "number"},
						invcClaimTotAmt: {type: "number"}
					}
				}
			}
		},
		columns: [
			{ field:"rnum", title:"<spring:message code='ser.lbl.no' />", width:40 // 序号
				, sortable:false, attributes:{"class":"ac"}
			},
			{ field:"dlrCd", title:"<spring:message code='mis.lbl.dlrCd' />", width:90 // 经销商代码
                ,attributes:{"class":"ac"}
            },
            { field:"dlrNm", title:"<spring:message code='mis.lbl.dlrNm' />", width:200 // 经销商名称
                ,attributes:{"class":"ac"}
            },
			{ field:"invcNo", title:"<spring:message code='ser.lbl.settlementStatementNo' />", width:120 // 结算报表编号
                ,attributes:{"class":"ac"}
            },
            { field:"paymNm", title:"<spring:message code='ser.lbl.remittanceStatus' />", width:90 // 汇款状态名称
                ,attributes:{"class":"ac"}
            },
            { field:"paymDt", title:"<spring:message code='ser.lbl.paymentDate' />", width:200 // 汇款日期
                ,attributes:{"class":"ac"}
            	,format:"{0:<dms:configValue code='dateFormat' />}"
            },
            { field:"invcDt", title:"<spring:message code='ser.lbl.invcDt' />", width:200 // 结算报表日期
                ,attributes:{"class":"ac"}
            	,format:"{0:<dms:configValue code='dateFormat' />}"
            },
            { field:"confirmTotAmt", title:"<spring:message code='ser.lbl.invcClaimTotAmt' />", width:90 // 确定金额
                ,attributes:{"class":"ac"}
            },
            { field:"ddctTotAmt", title:"<spring:message code='par.lbl.dcAmt' />", width:90 // 折扣金额
                ,attributes:{"class":"ac"}
            },
            { field:"invcClaimTotAmt", title:"<spring:message code='ser.lbl.confirmTotAmt' />", width:90 // 结算金额
                ,attributes:{"class":"ac"}
            }
		]
        ,navigatable:false
        ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
        ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
        ,multiSelectWithCheckbox:true       //멀티선택 적용. default:false
        ,multiSelectLocked:false            //멀티선택 컬럼 틀고정 default:false
        ,appendEmptyColumn:false           //빈컬럼 적용. default:false
        ,sortable:true
        ,enableTooltip:true
        ,editable:false
        ,height: 300
        ,dataBound: function (e){ // 表格加载完之后加载dataBound方法
        	var selectVal = e.sender.dataItem(e.sender.tbody.find("tr")[gridRow]);
        	if (selectVal != null){
        		e.sender.select(e.sender.tbody.find("tr")[gridRow]); // 反显列表框
        	}
        }
        ,change: function (e){
        	var selectVal = this.dataItem(this.select()); // 获取选中行的数据
        	gridRow = $("#mainGrid").data("kendoExtGrid").select().index(); // 获取选中的列
        	if (selectVal != null && selectVal.dlrCd != null){ // 判断是否选中数据
        		$("#receiptGrid").data("kendoExtGrid").dataSource.read(); // 查询发票信息
        	}else{
        		$("#receiptGrid").data("kendoExtGrid").dataSource.data([]); // 清空发票信息列表数据
        	}
        }
	});

	// 发票信息查询
	$("#receiptGrid").kendoExtGrid({
		gridId: "",
		dataSource: {
			transport: {
				read: { 
					url: "<c:url value='/ser/wac/claimInvoice/selectReceiptByInvcNo.do' />" // 查询汇款单信息
				},
				parameterMap: function(options, operation){
					if (operation === "read"){
						var params = {};
						
						params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;
                        
                        var grid = $("#mainGrid").data("kendoExtGrid");
                        var dataItem = grid.dataItem(grid.select());
                        params["dlrCd"] = dataItem.dlrCd;
                        params["invcNo"] = dataItem.invcNo;
                        
                        return kendo.stringify(params);
					}else if (operation !== "read" && options.models){
						return kendo.stringify(options.models);
					}
				}
			},
			schema: {
				errors: "error",
				data: "data",
				total: "total",
				model: {
					id: "order",
					fields: { 
						receiptCd: {type: "string"},
						buyNm: {type: "string"},
						taxpayerIdCd: {type: "string"},
						receiptIssDt: {type: "date"},
						sumAmt: {type: "number"},
						invcDt: {type: "date"},
						remark: {type: "string"}
					}
				}
			}
		},
		columns: [
			{ field:"receiptCd", title:"<spring:message code='ser.lbl.InvoiceClaimNo' />", width:90 // 发票号
                ,attributes:{"class":"ac"}
            },
            { field:"buyNm", title:"<spring:message code='ser.lbl.InvoiceClaimTitle' />", width:190 // 发票抬头
                ,attributes:{"class":"ac"}
            },
			{ field:"taxpayerIdCd", title:"<spring:message code='sal.lbl.PayTaxPinNo' />", width:190 // 纳税人识别号
                ,attributes:{"class":"ac"}
            },
            { field:"sumAmt", title:"<spring:message code='ser.lbl.InvoiceClaimAmt' />", width:90 // 发票金额
                ,attributes:{"class":"ac"}
            },
            { field:"invcDt", title:"<spring:message code='ser.lbl.invoiceDt' />", width:120 // 发票日期
                ,attributes:{"class":"ac"}
            	,format:"{0:<dms:configValue code='dateFormat' />}"
            },
            { field:"settlementNo", title:"<spring:message code='ser.lbl.InvoiceClaimRemark' />", width:190 // 发票备注
                ,attributes:{"class":"ac"}
            },
		]
        ,navigatable:false
        ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
        ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
        ,multiSelectWithCheckbox:false       //멀티선택 적용. default:false
        ,multiSelectLocked:false            //멀티선택 컬럼 틀고정 default:false
        ,appendEmptyColumn:false           //빈컬럼 적용. default:false
        ,sortable:true
        ,enableTooltip:true
        ,editable:false
        ,height: 300
        ,autoBind: false		// 是否启用自动绑定数据，默认为true,设置为false时需要手动调用read()或者page()方法进行数据绑定
	});
	
	// 导出Excel
    $("#btnExcelExport").kendoButton({
        click:function(e) {
        	var params = {};
            params["dlrCd"] = $("#sDlrCd").val();
            params["dlrNm"] = $("#sDlrNm").val();
            params["invcNo"] = $("#sInvcNo").val();
            params["paymTp"] = $("#sPaymTp").val();
           	params["invcDtStart"] = $("#sInvcDtStart").val();
           	params["invcDtEnd"] = $("#sInvcDtEnd").val();
        	$.ajax({
                url:"<c:url value='/ser/wac/claimInvoice/selectClaimInvoiceRemittanceExcelCnt.do'/>",
                 data:JSON.stringify(params),
                 type:'POST',
                 dataType:'json',
                 contentType:'application/json',
                 error:function(jqXHR,status,error) {
                     dms.notification.error(jqXHR.responseJSON.errors);
                 },
                 success:function(count) {
                     if (count == 0){
                         // 提示没有可以导出的数据.
                         dms.notification.success("<spring:message code='global.error.failedCreateExcel' />");
                     }else{
                    	 dms.ajax.excelExport({ // 导出 Excel
         		            "beanName":"claimInvoiceRemittanceService"
         		            ,"templateFile":"ClaimInvoiceRemittance_Tpl.xlsx"
         		            ,"fileName":"<spring:message code='ser.title.listOfRemittanceOrders' />.xlsx"
         		            ,"dlrCd":$("#sDlrCd").val()
         		            ,"dlrNm":$("#sDlrNm").val()
         		            ,"invcNo":$("#sInvcNo").val()
         		            ,"paymTp":$("#sPaymTp").val()
         		            ,"invcDtStart":$("#sInvcDtStart").val()
         		            ,"invcDtEnd":$("#sInvcDtEnd").val()
         		        });
                     }
                 }
             });
        }

    });
	
  // 批量导入按钮
   $(document).on("click", "#btnExcelImport", function(e){
         var gotoUrl = "<c:url value='/ser/wac/claimInvoice/selectClaimInvoiceRemittanceBatchUpload.do'/>";
         var heightVal = "600";
         gridRow = ""; // 清楚汇款单列表选中标记
         
         selectClaimInvoiceRemittanceBatchUpload = dms.window.popup({ // 跳转到批量导入子页面
            windowId:"selectClaimInvoiceRemittanceBatchUpload"
            , width:"75%"
            , height:600
            , title:"<spring:message code='ser.title.claimRemittanceUpload' />"    // 索赔汇款上传
            , content:{
                url:gotoUrl
                , data:{
                }
            }
        });
    });

})

</script>
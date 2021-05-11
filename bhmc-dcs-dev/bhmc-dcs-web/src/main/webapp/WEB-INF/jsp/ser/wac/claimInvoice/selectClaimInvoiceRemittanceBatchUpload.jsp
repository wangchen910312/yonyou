<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script type="text/javascript" src="<c:url value='/resources/js/jquery-ui-1.11.4.custom/jquery-ui.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/resources/js/jquery.form.js'/>"></script>
<script type="text/javascript" src="<c:url value='/resources/js/dms/jquery.ui.ext-1.0.js'/>"></script>

<section id="windows" class="pop_wrap">
    <div class="header_area">
        <div class="btn_right">
            <button id="btnFileDownload" class="btn_s"><spring:message code="ser.btn.templateDownload" /><!-- 下载格式 --></button>
            <button id="btnDel" class="btn_s"><spring:message code="ser.lbl.del" /><!-- 删除 --></button>
            <button id="btnSave" class="btn_s"><spring:message code="global.btn.save" /><!-- 保存 --></button>
         </div>
    </div>

    <div class="table_form" role="search" data-btnid="btnSearch">
        <form id="uploadForm" name="uploadForm" method="post" enctype="multipart/form-data" action="<c:url value="/ser/wac/claimInvoice/selectClaimInvoiceRemittanceUploadFile.do"/>">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:70%;">
                <col>
            </colgroup>
            <tbody>
                <tr>
                    <td>
                        <input type="file" id="uploadFile" name="uploadFile" class="form_file" />
                    </td>
                    <td></td>
                </tr>
            </tbody>
        </table>
        </form>
    </div>
    
    <div id="progressSection"></div>

    <div class="table_grid mt10">
        <div id="excelGrid" class="grid"></div>
    </div>
</section>

<script type="text/javascript">
var gridList = [];

$(document).ready(function() {


  	// 下载导入格式
    $("#btnFileDownload").kendoButton({
        click:function(e){
            location.href = "<c:url value='/cmm/sci/selectExcelTemplateDownload.do' />" + "?fileNm=ClaimInvoiceRemittanceListUpload.xlsx";
        }
    });

  	// 删除按钮
	$("#btnDel").kendoButton({
    	click:function(e){
    		var grid = $("#excelGrid").data("kendoExtGrid");
    		var rows = grid.select();
    		if (rows.length == 0){
    			// 提示没有选中数据
                dms.notification.info("<spring:message code='ser.error.pleaseSelectTheDataToDeleteFirst' />");
                return;
    		}
    		rows.each(function(index, row) { // 删除选中的数据
                grid.removeRow(row);
            });
   		}
	});

    // 保存按钮
    $("#btnSave").kendoButton({
        click:function(e){
        	var grid = $("#excelGrid").data("kendoExtGrid");
            var tableList = grid.dataSource.data();
            var saveData = grid.getCUDData("insertList", "updateList","deleteList");
            saveData.updateList = [];
            saveData.deleteList = [];
            var bool = false;
            
            if (tableList.length < 1){ // 判断表格数据是否为空
            	// 提示没有变更信息.
                dms.notification.info("<spring:message code='global.info.required.change'/>");
                return;
            }
            tableList.forEach(function (e){ // 循环表格数据
            	if (e.errorYn == 'Y'){ // 判断是否存在错误数据
            		bool = true;
            	}
            	saveData.updateList.push({"dlrCd":e.dlrCd, "invcNo":e.invcNo});
            })
            if (bool){
            	// 提示有错误数据
                dms.notification.info("<spring:message code='ser.error.pleaseDeleteTheErrorDataFirst' />");
                return;
            }
            
            $.ajax({
                url:"<c:url value='/ser/wac/claimInvoice/updateClaimInvoiceRemittanceBatch.do'/>",
                 data:JSON.stringify(saveData),
                 type:'POST',
                 dataType:'json',
                 contentType:'application/json',
                 error:function(jqXHR,status,error) {
                     dms.notification.error(jqXHR.responseJSON.errors);
                 },
                 success:function(jqXHR, textStatus) {
                     if (jqXHR > 0){
                         // 操作成功.
                         dms.notification.success("<spring:message code='global.info.success'/>");
                         window.parent.$("#receiptGrid").data("kendoExtGrid").dataSource.data([]); // 清空主页面发票信息数据
                         window.parent.$('#mainGrid').data('kendoExtGrid').dataSource.page(1); // 重新加载主页面汇款单数据
                         window.parent.selectClaimInvoiceRemittanceBatchUpload.close(); // 关闭弹出框
                     }else{
                         dms.notification.info("<spring:message code='par.info.cnfmModifyChkMsg'/>");
                     }
                 }
             });
        }
    });
    
  // 选完需要上传的文件时调用的方法
	$("#uploadFile").change(function(){
		if(dms.string.isEmpty($(this).val())) { // 判断所选文件是否为空
     		dms.notification.show("<spring:message code='global.lbl.file' var='fileMsg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${fileMsg}' />", "popup");
     		return;
 		}
		gridList = [];
 		$("#progressSection").excelUpload("upload");
	});
  
	$("#progressSection").excelUpload({
        progressId :"UPLOAD_MESSAGE_SOURCE"
        ,uploadForm :"uploadForm"
        ,uploadStatusUrl:"<c:url value='/cmm/excelUpload/selectExcelUploadStatus.do' />"
        ,interval:300
        ,messages:{
            fileUpload:"<spring:message code='global.info.fileUpload.processing' />"
            ,fileUploadComplete:"<spring:message code='global.info.fileUpload.complete' />"
            ,dataExtract:"<spring:message code='global.info.excelUpload.dataExtract.complete' />"
            ,dataExtractComplate:"<spring:message code='global.info.excelUpload.dataExtract.processing' />"
            ,uploadComplete:"<spring:message code='global.info.excelUpload.complete' />"
        }
	    ,callback:function(obj){ // 解析上传文件的回调方法   
	    	if (obj.length > 0){
		        obj.forEach(function (element){ // 循环上传的excel文件中的数据
		    		var param = {};
		        	param["dlrCd"] = element.dlrCd;
		        	param["uploadDt"] = element.uploadDt;
		        	param["invcNo"] = element.invcNo;
		        	param["errorYn"] = element.errorYn;
	        		param["errorMessage"] = element.errorMessage;
	        		param["rnum"] = element.rnum;
		        	gridList.push(param);
		        });
		        $("#excelGrid").data('kendoExtGrid').dataSource.data(gridList);
	    	}
	    }
    });
	
    // table表格
    $("#excelGrid").kendoExtGrid({
        dataSource:{
            data:gridList
            ,schema:{
                model:{
                    id:"rnum"
                    ,fields:{
                    	rnum: {type:"number"}
                        ,errorYn:{type:"string", editable:false}
                        ,errorMessage:{type:"string", editable:false}
                        ,uploadDt:{type:"date", editable:false}
                        ,dlrCd:{type:"string", editable:false}
                        ,invcNo:{type:"string", editable:false}
                    }
                }
            }
        }
        ,height:450
        ,autoBind:false
        ,pageable: false
        ,columns:[
			{ field:"rnum", title:"<spring:message code='ser.lbl.no' />", width:40 // 序号
				, sortable:false, attributes:{"class":"ac"}
			}
            ,{field:"errorYn", title:"<spring:message code='global.lbl.errYn' />", width:40, attributes:{"class":"ac"}} // 是否错误
            ,{field:"errorMessage", title:"<spring:message code='global.lbl.errMesgTxt' />", width:120 ,attributes:{"class":"al"} } // 错误信息
            ,{field:"uploadDt", title:"<spring:message code='sal.lbl.uploadDtTime' />", width:100, format:"{0:n0}" ,attributes:{"class":"ac"} } // 上传时间
            ,{field:"dlrCd", title:"<spring:message code='global.lbl.dlrCd' />", width:80 ,attributes:{"class":"ac"} } // 经销商代码
            ,{field:"invcNo", title:"<spring:message code='ser.lbl.settlementStatementNo' />", width:80,attributes:{"class":"ac"}} // 结算单编号
        ]

    });

});
</script>










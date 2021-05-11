<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<style type="text/css">
.form_readonly_text_blue {background-color:#dbdbdb!important; -webkit-text-fill-color:#45b4e8; color:#45b4e8!important; -webkit-opacity:1; opacity:1;}

.inputX::-ms-clear {display: none;}

</style>

<!-- 날짜, 통화 -->
<dms:configValue code='dateFormat' var="_dateFormat" />
<dms:configValue code='dateTimeFormat' var="_dateTimeFormat" />

<!-- 계약관리 상세 -->
<section id="window" class="pop_wrap">
<form id="contForm" name="contForm" method="POST">

    <!-- 계약상세정보 -->
    <section class="group">
        <div class="header_area">
            <%-- <h2 class="title_basic"><spring:message code='sal.title.retailContractDetail' /></h2> --%>    <!-- 계약상세정보 -->

            <div class="left_area">
                <!-- 판매기회여부 -->
                <%-- <input id="saleOpptYn" type="checkbox" class="form_check" disabled /><spring:message code='global.lbl.saleOpptYn' /> --%>
                <span id="saleOpptTxt" class="txt_label bg_green" style="display:none"> <spring:message code='global.lbl.saleOppt' /> </span>   <!-- 판매기회 -->
            </div>
            <div id="dPopButton" class="btn_right">
        		<button id="btnSave"   type="button" class="btn_m"><spring:message code='global.btn.save' /></button>            <!-- 저장 -->
            </div>
        </div>
        <div class="table_grid">
        	<div id="grid" ></div>
        </div>

        <div class="table_form">
            <table>
                <caption></caption>
                <colgroup>
                    <col style="width:15%;">
                    <col style="width:25%;">
                    <col style="width:15%;">
                    <col style="width:25%;">
                </colgroup>
                <tbody>
                    <tr>
							<th scope="row"><span class="bu_required"><spring:message code='sal.lbl.ReceiptCd' /></th>        <!-- 发票代码 -->
							<td>
								<input id="receiptCd" name="receiptCd" class="form_input" data-json-obj="true" />
							</td>
							<th scope="row"><span class="bu_required"><spring:message code='sal.lbl.ReceiptNo' /></th> <!-- 发票号码 -->
							<td>
								<input id="receiptNo" name="receiptNo" class="form_input" data-json-obj="true" />
							</td>
						</tr>
						<tr> 
							<th scope="row"><span class="bu_required"><spring:message code='sal.lbl.ReceiptPubDt' /></span></th>    <!-- 开票日期 -->
							<td>
								<input id="receiptPubDt" name="receiptPubDt" class="form_datepicker" data-json-obj="true" />
							</td>
							<th scope="row"><span class="bu_required"><spring:message code='sal.lbl.realCarAmts' /></span></th>     <!-- 판매담당자 -->
							<td>
								<input id="sumAmt" name="sumAmt" onkeyup="this.value=this.value.replace(/[^\- \d.]/g,'')" class="form_input" type="number" data-json-obj="true" />
							</td>
							<th scope="row" class="bor_none"></th>
							<td></td>
						</tr>
                </tbody>
            </table>
        </div>
    </section>
    <!-- //계약상세정보 -->
</form>
</section>

<script type="text/javascript">

var options = parent.receiptScanAddPopupWindow.options.content.data;

$("#receiptPubDt").kendoExtMaskedDatePicker({
    format:"<dms:configValue code='dateFormat' />"
    ,dateValidMessage:"<spring:message code='ser.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    ,value:"${sFromDt}"
});

var windowHeight = $(window).innerHeight();

// 唐伟 2021/04/08 发票添加弹出框的保存操作
$("#btnSave").kendoButton({
    click:function(e) {  
   	    
	   	 var saveDataRows = $("#tableId").find('tbody').find('tr');
	   	 var receiptCd = $("#receiptCd").val();
	   	 var receiptNo = $("#receiptNo").val();
	   	 var receiptPubDt = $("#receiptPubDt").val();
	   	 var sumAmt = $("#sumAmt").val();
	   	 var btnFlag = "2";
	   	 var dataMap = new Object();
	   	 dataMap["receiptCd"] = receiptCd;
	   	 dataMap["receiptNo"] = receiptNo;
	   	 dataMap["receiptPubDt"] = receiptPubDt;
	   	 dataMap["sumAmt"] = sumAmt;
	   	 dataMap["btnFlag"] = btnFlag;
	   	 
        // 唐伟  2021/04/08 发票号必须是8位的数字，否则提示“发票号应为8位数字，实际为*位(取发票识别结果的位数显示)； 如果是8个0的数，也不行
        var receiptNo = $("#receiptNo").val();
        if(8!=receiptNo.length){
            dms.notification.warning("<spring:message code='global.err.eightNumber' arguments='"+receiptNo.length+"'/>");
            return;
        }
     	// 唐伟  2021/04/01 发票代码必须是10位数字，否则提示“发票代码应为10位数字，实际为*位(取发票识别结果的位数显示)
        var receiptCd = $("#receiptCd").val();
        /* if(12!=receiptCd.length){
            dms.notification.warning("<spring:message code='global.err.invoiceEgCodeShould' arguments='"+receiptCd.length+"'/>");
            return;
        } */
        // 判断日期是否为空，为空给出提示
        var receiptPubDt = $("#receiptPubDt").val();
        if(receiptPubDt==null || receiptPubDt=="" || receiptPubDt.length==0){
            dms.notification.warning("<spring:message code='sal.info.receiptIssDateCheck'/>");
            return;
        }
        // 校验开票价是否为空
        var sumAmt = $("#sumAmt").val();
        if(sumAmt ==null || sumAmt==""){
        	dms.notification.warning("<spring:message code='sal.info.sumAmtCheck'/>");
            return;
        }
        // 校验开票价是否为正值
        if(sumAmt<=0){
        	dms.notification.warning("<spring:message code='sal.info.sumAmtIsPositive'/>");
            return;
        }
        var grid = $("#grid").data("kendoExtGrid");
        var param = {
        	 "dataMap":dataMap
        }; 
        $.ajax({
            url:"<c:url value='/sal/rcp/addOrValidaReceiptScan.do' />"
            ,data:JSON.stringify(param)
            ,type:'POST'
            ,dataType:'json'
            ,contentType:'application/json'
            ,error :function(jqXHR,status,error) {
                dms.loading.hide();
                if(jqXHR.responseJSON.errors != null && jqXHR.responseJSON.errors.length > 0){
                    dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                }else{
                    dms.notification.error(error);
                }
            }
            ,success:function(jqXHR, textStatus) {
            	dms.loading.hide();
            	dms.notification.success("<spring:message code='global.lbl.save' var='globalLblSave' /><spring:message code='global.info.successMsg' arguments='${globalLblSave}' />");
            	parent.$('#receiptScanGrid').data('kendoExtGrid').dataSource.page(1);
            	parent.receiptScanAddPopupWindow.close();            
            }
        });
       
    }	
});
</script>
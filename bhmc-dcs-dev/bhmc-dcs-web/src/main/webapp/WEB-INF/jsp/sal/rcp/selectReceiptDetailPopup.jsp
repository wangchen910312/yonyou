<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<%--
    JSP Name : selectReceiptDetailPopup.jsp
    Description : 영수증 명세 팝업
    author Yunseung Kim
    since 2017. 3. 22.
    version 1.0
    Modification Information
       since          author              description
    ===========    =============    ===========================
    2017. 3. 22.     Yunseung Kim     최초 생성
--%>
<section id="windows" class="pop_wrap">
    <div class="header_area">

    </div>

    <div class="table_info table_info">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:30%;">
                <col style="width:70%;">
            </colgroup>
            <thead>
                <tr>
                    <th scope="col"><spring:message code='sal.lbl.Item' /></th>
                    <th scope="col"><spring:message code='global.lbl.infoData' /></th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <th scope="row"><spring:message code='sal.lbl.ReceiptPubDt' /></th>
                    <td><input type="text" id="scanRcptPubDt" name="scanRcptPubDt" style="width:100%;background-color:transparent;text-align:left;border-style:none;font-weight:bold;" readonly></td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code='sal.lbl.ReceiptCd' /></th>
                    <td><input type="text" id="scanRcptCd" name="scanRcptCd" style="width:100%;background-color:transparent;text-align:left;border-style:none;font-weight:bold;" readonly></td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code='sal.lbl.rcptNo' /></th>
                    <td><input type="text" id="scanRcptNo" name="scanRcptNo" style="width:100%;background-color:transparent;text-align:left;border-style:none;font-weight:bold;" readonly></td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code='sal.lbl.PayTaxPinNo' /></th>
                    <td><input type="text" id="scanPayTaxPinNo" name="scanPayTaxPinNo" style="width:100%;background-color:transparent;text-align:left;border-style:none;font-weight:bold;" readonly></td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code='sal.lbl.PurchaseComInfo' /></th>
                    <td><input type="text" id="scanCustInfo" name="scanCustInfo" style="width:100%;background-color:transparent;text-align:left;border-style:none;font-weight:bold;" readonly></td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code='sal.lbl.ssnCrnNo' /></th>
                    <td><input type="text" id="scanSsnCrnNo" name="scanSsnCrnNo" style="width:100%;background-color:transparent;text-align:left;border-style:none;font-weight:bold;" readonly></td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code='sal.lbl.carVinNo' /></th>
                    <td><input type="text" id="scanVinNo" name="scanVinNo" style="width:100%;background-color:transparent;text-align:left;border-style:none;font-weight:bold;" readonly></td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code='sal.lbl.certNo' /></th>
                    <td><input type="text" id="scanCertNo" name="scanCertNo" style="width:100%;background-color:transparent;text-align:left;border-style:none;" readonly></td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code='sal.lbl.engNo' /></th>
                    <td><input type="text" id="scanEngNo" name="scanEngNo" style="width:100%;background-color:transparent;text-align:left;border-style:none;" readonly></td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code='sal.lbl.TaxIncludeSumAmtNum' /></th>
                    <td class="ar child_borderNone"><input type="text" id="scanTaxIncPrice" name="scanTaxIncPrice" class="form_numeric al" style="width:100%;background-color:transparent;text-align:left;border-style:none;" readonly></td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code='sal.lbl.TaxUndercoverageAmt' /></th>
                    <td class="ar child_borderNone"><input type="text" id="scanTaxExcPrice" name="scanTaxExcPrice" class="form_numeric al" style="width:100%;background-color:transparent;text-align:left;border-style:none;" readonly></td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code='sal.lbl.taxRate' /></th>
                    <td><input type="text" id="scanTaxRate" name="scanTaxRate" style="width:100%;background-color:transparent;text-align:left;border-style:none;" readonly></td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code='par.lbl.vatAmt' /></th>
                    <td class="ar child_borderNone"><input type="text" id="scanTaxAmt" name="scanTaxAmt" class="form_numeric al" style="width:100%;background-color:transparent;text-align:left;border-style:none;" readonly></td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code='global.lbl.carlineNm' /></th>
                    <td><input type="text" id="carlineNm" name="carlineNm" style="width:100%;background-color:transparent;text-align:left;border-style:none;" readonly></td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code='sal.lbl.ocnDesc' /></th>
                    <td><input type="text" id="ocnNm" name="ocnNm" style="width:100%;background-color:transparent;text-align:left;border-style:none;" readonly></td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code='global.lbl.extColorNm' /></th>
                    <td><input type="text" id="extColorNm" name="extColorNm" style="width:100%;background-color:transparent;text-align:left;border-style:none;" readonly></td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code='global.lbl.dlrNm' /></th>
                    <td><input type="text" id="dlrNm" name="dlrNm" style="width:100%;background-color:transparent;text-align:left;border-style:none;" readonly></td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code='sal.lbl.SalesComNm' /></th>
                    <td><input type="text" id="scanSaleCmpnNm" name="scanSaleCmpnNm" style="width:100%;background-color:transparent;text-align:left;border-style:none;" readonly></td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code='par.lbl.addr' /></th>
                    <td><input type="text" id="scanSaleCmpnAddr" name="scanSaleCmpnAddr" style="width:100%;background-color:transparent;text-align:left;border-style:none;" readonly></td>
                </tr>
            </tbody>
        </table>
    </div>
    <div class="header_area">
        <div class="btn_right">
            <button type="button" id="btnClose" class="btn_s btn_s_min5"><spring:message code="par.btn.close" /></button>
        </div>
    </div>
</section>

<script type="text/javascript">
	$(document).ready(function() {
	    var options = parent.receiptDetailPopupWindow.options.content.data;
	    
	    $("#scanTaxIncPrice").kendoExtNumericTextBox({
	        format : "n2",
	        decimals : 2,
	        value : 0.00,
	        spinners : false
	    });
	
	    $("#scanTaxExcPrice").kendoExtNumericTextBox({
	        format : "n2",
	        decimals : 2,
	        value : 0.00,
	        spinners : false
	    });
	
	    $("#scanTaxAmt").kendoExtNumericTextBox({
	        format : "n2",
	        decimals : 2,
	        value : 0.00,
	        spinners : false
	    });
	    
	    // btnClose
	    $("#btnClose").kendoButton({
	        click : function(e) {
	            parent.receiptDetailPopupWindow.close();
	        }
	    });
	
	    $.ajax({
	        url : "<c:url value='/sal/rcp/selectReceiptDetailPopupSearch.do' />",
	        data : JSON.stringify({sCarId : options.sCarId, sReceiptNo : options.sReceiptNo}), //R19111100817 一台车提交了两个不同号的发票，应该显示两行，目前只显示了一行。同时希望可以像<新能源补贴申请审核>页面类似的，可显示全部和最新的数据 贾明 2019-11-11
	        type : 'POST',
	        dataType : 'json',
	        contentType : 'application/json',
	        async : false,
	        error : function(jqXHR,status,error) {
	            // itemCd not use check message
	        },
	        success : function(data, textStatus) {
	        	$("#scanRcptPubDt").val(kendo.toString(kendo.parseDate(data.receiptIssDt), "yyyy-MM-dd"));
	            $("#scanRcptCd").val(data.receiptCd);
	            $("#scanRcptNo").val(data.receiptNo);
	            $("#scanCustInfo").val(data.receiptCustNm);
	            $("#scanSsnCrnNo").val(data.ssnCrnNo);
	            $("#scanCertNo").val(data.certNo);
	            $("#scanEngNo").val(data.engnNo);
	            $("#scanVinNo").val(data.scanVinNo);
	            $("#scanTaxIncPrice").data("kendoExtNumericTextBox").value(Number(data.sumIncTax));
	            $("#scanTaxExcPrice").data("kendoExtNumericTextBox").value(Number(data.sumExcTax));
	            $("#scanTaxRate").val(data.taxRt);
	            $("#scanTaxAmt").data("kendoExtNumericTextBox").value(Number(data.taxAmt));
	            $("#scanPayTaxPinNo").val(data.taxpayerIdCd);
	            $("#carlineNm").val(data.carlineNm);
                $("#ocnNm").val(data.ocnNm);
                $("#extColorNm").val(data.extColorNm);
                $("#dlrNm").val(data.dlrNm);
	            $("#scanSaleCmpnNm").val(data.merchNm);
	            $("#scanSaleCmpnAddr").val(data.addr);
	        }
	    });
	});
</script>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>


<section id="windows" class="pop_wrap">
<%-- <button type="button" class="btn_m btn_submit" id="btnSubmit"><spring:message code='global.btn.submit' /></button> --%>
    <!-- 영수증 -->
    <div class="mt0" id="receiptUpload">
        <div class="workProgress_btnArea2 clfix">
            <div class="inbox" style="width:40%">
                <div class="top_area">
                    <p class="top_txt"><spring:message code='sal.lbl.ScanInfo' /></p>
                </div>
                <div class="con_area">
                    <div class="table_info">
                        <table>
                            <caption></caption>
                            <colgroup>
                                <col style="width:35%;">
                                <col style="width:65%;">
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
                                    <td><input type="text" id ="scanRcptPubDt" name="scanRcptPubDt" class="none_input_form" readonly /></td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='sal.lbl.ReceiptCd' /></th>
                                    <td><input type="text" id="scanRcptCd" name="scanRcptCd" class="none_input_form" readonly /></td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='sal.lbl.rcptNo' /></th>
                                    <td><input type="text" id="scanRcptNo" name="scanRcptNo" class="none_input_form" readonly/></td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='sal.lbl.PayTaxPinNo' /></th>
                                    <td><input type="text" id="scanPayTaxPinNo" name="scanPayTaxPinNo" class="none_input_form" readonly /></td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='sal.lbl.PurchaseComInfo' /></th>
                                    <td><input type="text" id="scanCustInfo" name="scanCustInfo" class="none_input_form" readonly /></td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='sal.lbl.ssnCrnNo' /></th>
                                    <td><input type="text" id="scanSsnCrnNo" name="scanSsnCrnNo" class="none_input_form" readonly /></td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='sal.lbl.carVinNo' /></th>
                                    <td><input type="text" id="scanVinNo" name="scanVinNo" class="none_input_form" readonly /></td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='sal.lbl.certNo' /></th>
                                    <td><input type="text" id="scanCertNo" name="scanCertNo" class="none_input_form" readonly /></td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='sal.lbl.engNo' /></th>
                                    <td><input type="text" id="scanEngNo" name="scanEngNo" class="none_input_form" readonly /></td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='sal.lbl.TaxIncludeSumAmtNum' /></th>
                                    <td><input type="text" id="scanTaxIncPrice" name="scanTaxIncPrice" class="none_input_form" readonly /></td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='sal.lbl.TaxUndercoverageAmt' /></th>
                                    <td><input type="text" id="scanTaxExcPrice"  name="scanTaxExcPrice" class="none_input_form" readonly /></td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='sal.lbl.taxRate' /></th>
                                    <td><input type="text" id="scanTaxRate" name="scanTaxRate" class="none_input_form" readonly /></td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='par.lbl.vatAmt' /></th>
                                    <td><input type="text" id="scanTaxAmt" name="scanTaxAmt" class="none_input_form" readonly /></td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='sal.lbl.SalesComNm' /></th>
                                    <td><input type="text" id="scanSaleCmpnNm" name="scanSaleCmpnNm" class="none_input_form" readonly /></td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='par.lbl.addr' /></th>
                                    <td><input type="text" id="scanSaleCmpnAddr" name="scanSaleCmpnAddr" class="none_input_form" readonly /></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <div class="inbox" style="width:55%">
                <div class="top_area">
                    <p class="top_txt"><spring:message code='sal.lbl.ScanImage' /></span></p>
                </div>
                <div class="con_area">
                    <!-- width:100%;height:369px; -->
                    <img id="scanImageView" src="" style="width:100%; display:block;">
                </div>
            </div>
        </div>
        <br>
    </div>
<!-- 영수증 업로드-->
</section>


<script type="text/javascript">

/**
 * 팝업 옵션
 */
var parentData = parent.salesVhcCvinRctPopupWin.options.content.data;

$(document).ready(function(){
    
    
    $("#btnSubmit").kendoButton({
        click:function(e) {
            detailSet();
        }
    });
    
    detailSet = function(){
        
        $.ajax({
            url:"<c:url value='/sal/rcp/selectSalesVehicleCombineRptByKey.do' />",
            type:'POST',
            dataType:'json',
            data: "sVinNo="+parentData.sVinNo,
//            data: "sVinNo=LBEADAFC1HX157245",
            async : false,
            error:function(jqXHR,status,error){
                dms.notification.error(jqXHR.responseJSON.errors);
            },
            success:function(data){
                
                $("#scanRcptPubDt").val(kendo.toString(kendo.parseDate(data.receiptIssDt), "yyyy-MM-dd"));
                $("#scanRcptCd").val(data.receiptCd);
                $("#scanRcptNo").val(data.receiptNo);
                $("#scanCustInfo").val(data.receiptCustNm);
                $("#scanSsnCrnNo").val(data.ssnCrnNo);
                $("#scanCertNo").val(data.certNo);
                $("#scanEngNo").val(data.engnNo);
                $("#scanVinNo").val(data.scanVinNo);
                $("#scanTaxIncPrice").val(data.sumIncTax);
                $("#scanTaxExcPrice").val(data.sumExcTax);
                $("#scanTaxRate").val(data.taxRt);
                $("#scanTaxAmt").val(data.taxAmt);
                $("#scanPayTaxPinNo").val(data.taxpayerIdCd);
                $("#scanSaleCmpnNm").val(data.merchNm);
                $("#scanSaleCmpnAddr").val(data.addr);
                
                //이미지 로딩
                if(dms.string.isNotEmpty(data.receiptImg)){
                    var fileView = document.querySelector("img");
                    var fileData = window.atob(data.receiptImg);
                    fileView.src = fileData;
                
                    fileView.onload = function() {
                        if(this.width > 880){
                            fileView.width = 880;
                        }else{
                            fileView.width = this.width;
                        }
                    };
                }
               
            }
        });
    };

     if( dms.string.isNotEmpty(parentData.sVinNo) ){
         detailSet();
     }
    
});
 
/* 
var salesVhcCvinRctPopupWin;
function selectPackageSalesWorkJudgePopupWindow(){

    salesVhcCvinRctPopupWin = dms.window.popup({
        windowId:"salesVhcCvinRctPopupWin"
        ,title:"<spring:message code='sal.title.ReceiptUpload' />"   
        ,width :1100
        ,height:470
        ,draggable:true
        ,modal:true
        ,resizable:false
        ,visible:false
        ,content:{
            url:"<c:url value='/sal/rcp/selectSalesVehicleCombineRptPopup.do'/>"
            ,data:{
                "type":null
                ,"autoBind":false
                ,"sVinNo":'LBEGCBFC9HX255295'
                ,"callbackFunc":function(data){
                     
                }
            }
        }

    });
} */
</script>

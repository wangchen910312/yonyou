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
                    <!--#D4D4D4 transparent crs 37 对于初审未通过的车架号，修改页面可修改的字段，给予颜色区分提示或备注说明 -->
                    <th scope="row" id="scanRecptTh"><spring:message code='sal.lbl.rcptNo'/></th>
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
                 <!-- crs 37 发票上传扫描信息显示的画面，在 证件号码后面增加 手机号码，取合同上的客户手机号，允许修改，校验手机号为11位数字。提交给发票系统，发票初审不通过时可修 贾明 2019-12-11 START-->
                 <tr style = "display:none">  <!--csr 63 发票上传界面的手机号输入想要去掉，现在是经销商录入的烦，而且业务 那边也确定说可以不用了 贾明 2020-3-4 -->
                     <th scope="row"><spring:message code='ser.lbl.mobilePhone' /><spring:message code='global.lbl.issueNo' /></th>
                     <td><input id="telNo" name="telNo" type="text" class="form_input numberic" data-type="mobile" pattern="\d" maxlength="11" data-json-obj="true" style="width:100%;background-color:transparent;text-align:left;border-style:none;font-weight:bold;" readonly /></td>
                  </tr>
                <!-- crs 37 发票上传扫描信息显示的画面，在 证件号码后面增加 手机号码，取合同上的客户手机号，允许修改，校验手机号为11位数字。提交给发票系统，发票初审不通过时可修 贾明 2019-12-11 END-->                                   
                <tr>
                    <!--#D4D4D4 transparent crs 37 对于初审未通过的车架号，修改页面可修改的字段，给予颜色区分提示或备注说明 -->
                    <th scope="row" id="scanVinNoTh"><spring:message code='sal.lbl.carVinNo' /></th>
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
                    <th scope="row"><spring:message code='sal.lbl.realCarAmts' /></th><!---R19080700284 价税合计小写  贾明 2019-8-7---><!--crs 37 价税合计小写 改为  开票价 贾明2019-12-12-->
                    <td class="ar child_borderNone"><input type="text" id="scanTaxIncPrice" name="scanTaxIncPrice" onkeyup="this.value=this.value.replace(/[^\- \d.]/g,'')" class="form_numeric al" style="width:100%;background-color:transparent;text-align:left;border-style:none;" readonly></td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code='sal.lbl.TaxUndercoverageAmt' /></th><!---R19080700284 不含税价只能是数字 贾明 2019-8-7--->
                    <td class="ar child_borderNone"><input type="text" id="scanTaxExcPrice" name="scanTaxExcPrice" onkeyup="this.value=this.value.replace(/[^\- \d.]/g,'')" class="form_numeric al" style="width:100%;background-color:transparent;text-align:left;border-style:none;" readonly></td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code='sal.lbl.taxRate' /></th>
                    <td><input type="text" id="scanTaxRate" name="scanTaxRate" style="width:100%;background-color:transparent;text-align:left;border-style:none;" readonly></td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code='par.lbl.vatAmt' /></th><!---R19080700284 税额只能是数字 贾明 2019-8-7--->
                    <td class="ar child_borderNone"><input type="text" id="scanTaxAmt" name="scanTaxAmt" onkeyup="this.value=this.value.replace(/[^\- \d.]/g,'')" class="form_numeric al" style="width:100%;background-color:transparent;text-align:left;border-style:none;" readonly></td>
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
            <button type="button" id="btnSubmit" class="btn_s btn_s_min5"><spring:message code="global.btn.submit" /></button> <!-- R19080700284 初审提交当不通时可修改提交 否则 隐藏  贾明 -->
            <button type="button" id="btnClose" class="btn_s btn_s_min5"><spring:message code="par.btn.close" /></button>
        </div>
    </div>
</section>

<script type="text/javascript">
$(document).ready(function() {
   //数字标识
  var onlyNum = new RegExp("[^0-9]","i");
     $(".numberic").keyup(function(e)
     {
         var content = $(this).val();
         if(content.match(onlyNum)){
             $(this).val('');
         }
     });
    var options = parent.receiptDetailPopupWindow.options.content.data;
     var certFst = options.sCertFst;//获取初审结果值 贾明 2019-8-12
    
    $("#scanTaxIncPrice").kendoExtNumericTextBox({
        format:"n2"
       ,decimals :2
       ,value:0.00
       ,spinners:false
    });

    $("#scanTaxExcPrice").kendoExtNumericTextBox({
        format:"n2"
       ,decimals :2
       ,value:0.00
       ,spinners:false
    });

    $("#scanTaxAmt").kendoExtNumericTextBox({
        format:"n2"
       ,decimals :2
       ,value:0.00
       ,spinners:false
    });

    
    //btnClose
    $("#btnClose").kendoButton({
        click:function(e){
            parent.receiptDetailPopupWindow.close();
        }
    });
    console.log("数据",options.sReceiptNo);
    $.ajax({
        url:"<c:url value='/sal/rcp/selectReceiptDetailPopupSearch.do' />"
        ,data:JSON.stringify({sCarId:options.sCarId,sReceiptNo:options.sReceiptNo})
        ,type:'POST'
        ,dataType:'json'
        ,contentType:'application/json'
        ,async:false
        ,error:function(jqXHR,status,error){
            // itemCd not use check message
        }
        ,success:function(data, textStatus){
           if('0' == certFst){
              $("#scanRcptPubDt").val(kendo.toString(kendo.parseDate(data.receiptIssDt), "yyyyMMdd"));
           }else {
            $("#scanRcptPubDt").val(kendo.toString(kendo.parseDate(data.receiptIssDt), "yyyy-MM-dd"));
           }
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
            $("#scanSaleCmpnNm").val(data.merchNm);
            $("#scanSaleCmpnAddr").val(data.addr);
            $("#telNo").val(data.telNo); //电话
        }
    });
    //R19080700284 初审回传结果有审核通过/不通过两种，在界面显示为“通过”或“不通过”。当为“不通过”时，进入发票明细界面可进行修改再提交的操作。 贾明2019-8-9 start
    // 宫荣枢 2021-05-08 审核状态通过的显示【查询】按钮，非通过的显示【修改】按钮
    if (certFst=="0") {
         $("#btnSubmit").show();
         var scanRcptPubDtVal  = $('#scanRcptPubDt').val();
         var scanRcptVal = scanRcptPubDtVal.split('-');
         $('#scanRcptPubDt').removeAttr("readonly");//开票日期
         $('#scanRcptCd').removeAttr("readonly");//发票代码
         //$('#scanRcptNo').removeAttr("readonly");//发票号码
         $('#scanPayTaxPinNo').removeAttr("readonly");//纳税人识别号
         $('#scanCustInfo').removeAttr("readonly");//购买方名称
         $('#scanSsnCrnNo').removeAttr("readonly");//证件号码
         $('#scanTaxIncPrice').removeAttr("readonly");//价税合计小写 crs 37 价税合计小写 改为  开票价 贾明2019-12-12
         $('#scanTaxExcPrice').removeAttr("readonly");//不含税价
         $('#scanTaxRate').removeAttr("readonly");//税率
         $('#scanTaxAmt').removeAttr("readonly");//税额
         $('#scanSaleCmpnNm').removeAttr("readonly");//销货单位名称
         $('#scanSaleCmpnAddr').removeAttr("readonly");//联系地址
         $('#telNo').removeAttr("readonly");//电话
         //crs 37   对于初审未通过的车架号，修改页面可修改的字段，给予颜色区分提示或备注说明 贾明 2019-12-12 start
         $('#scanRecptTh').attr('style','background-color:#D4D4D4;');
         $('#scanRcptNo').attr('style','width:100%;background-color:#D4D4D4;text-align:left;border-style:none;font-weight:bold;');
         $('#scanVinNoTh').attr('style','background-color:#D4D4D4;');
         $('#scanVinNo').attr('style','width:100%;background-color:#D4D4D4;text-align:left;border-style:none;font-weight:bold;');
         //crs 37   对于初审未通过的车架号，修改页面可修改的字段，给予颜色区分提示或备注说明 贾明 2019-12-12 end
    } else {
       $("#btnSubmit").hide();
    }
    $("#btnSubmit").kendoButton({
        click:function(e) {
      //R19080700284 发票号必须是8位的数字，否则提示“发票号应为8位数字，实际为*位(取发票识别结果的位数显示)； 如果是8个0的数，也不行 贾明 2019-8-6 start
          var scanRcptNoVal = $('#scanRcptNo').val();
         if(8!=scanRcptNoVal.length){
                dms.notification.warning("<spring:message code='global.err.eightNumber' arguments='"+scanRcptNoVal.length+"'/>");
                return;
            }
            if('00000000' == scanRcptNoVal ){
                dms.notification.warning("<spring:message code='global.err.cannotZero'/>");
                return;
            }
        //R19080700284发票号必须是8位的数字，否则提示“发票号应为8位数字，实际为*位(取发票识别结果的位数显示)； 如果是8个0的数，也不行 贾明 2019-8-6 end
         //R19080700284发票代码必须是12位的数字，否则提示“发票代码应为12位数字，实际为*位(取发票识别结果的位数显示)  发票代码的首个数字是1或2， 贾明 2019-8-7 start
             var scanRcptCdVal = $('#scanRcptCd').val();
             if(12!=scanRcptCdVal.length){
                dms.notification.warning("<spring:message code='global.err.invoiceCodeShould' arguments='"+scanRcptCdVal.length+"'/>");
                return;
             }
             if(scanRcptCdVal.length > 0){
                var scanRFirst = scanRcptCdVal.substr(0,1);
                if('1'!=scanRFirst && '2'!=scanRFirst){
                    dms.notification.warning("<spring:message code='global.err.invoiceNumberCode'/>");
                     return;
                }
             }
         //R19080700284发票代码必须是12位的数字，否则提示“发票代码应为12位数字，实际为*位(取发票识别结果的位数显示)  发票代码的首个数字是1或2， 贾明 2019-8-7 end
           var regexp =  /^(19|20)\d{2}(0[1-9]|1[012])(0[1-9]|[12][0-9]|3[0-1])$/;
            var value = regexp.test($("#scanRcptPubDt").val());

            if(!value){
               //R19080700284日期格式必须符合系统中日期格式的标准，否则提示“日期格式需符合20190526(取当前日期展示)，请修改”  global.err.checkDateValue 贾明 2019-8-7 start
                //dms.notification.warning("<spring:message code='global.err.checkDateValue' />");
                var toadyVal =  getyyyyMMdd();
                dms.notification.warning("<spring:message code='global.err.dateFromatShouldConform' arguments='"+toadyVal+"' />"); 
                //R19080700284日期格式必须符合系统中日期格式的标准，否则提示“日期格式需符合20190526(取当前日期展示)，请修改”  global.err.checkDateValue 贾明 2019-8-7 end
                $("#scanRcptPubDt").focus();
                return;
            }
            
            var currentDt = getyyyyMMdd();
            if(currentDt < $("#scanRcptPubDt").val()){
                // R19080700284识别出的日期在当前日期之后，提示“日期有误，请修改；贾明 2019-8-7 暂不提交这部分start
            	dms.notification.warning("<spring:message code='global.err.checkDateValue' />");
            	//dms.notification.warning("<spring:message code='global.err.dateIncorrectPleaseAmend' />");
            	 //R19080700284 识别出的日期在当前日期之后，提示“日期有误，请修改；暂不提交这部分 贾明 2019-8-7 end
            	$("#scanRcptPubDt").focus();
            	return; 
            }
            
            //  价税合计小写只能是数字  改为开票价start
            if(!($.isNumeric($("#scanTaxIncPrice").val()))) {
            	dms.notification.warning("<spring:message code='sal.lbl.realCarAmts' var='salLblTaxIncludeSumAmtNum' /><spring:message code='global.err.checkQtyParam' arguments='${salLblTaxIncludeSumAmtNum}'/>");
                return;
            }
          // 价税合计小写只能是数字 end
            //发票代码
            if(dms.string.isEmpty($('input[name="scanRcptCd"]').val())){
                dms.notification.info("<spring:message code='sal.lbl.ReceiptCd' var='salLblReceiptCd' /><spring:message code='global.info.emptyCheckParam' arguments='${salLblReceiptCd}' />");
                return;
            }
            //发票号码
            if(dms.string.isEmpty($('input[name="scanRcptNo"]').val())){
                dms.notification.info("<spring:message code='sal.lbl.rcptNo' var='salLblRcptNo' /><spring:message code='global.info.emptyCheckParam' arguments='${salLblRcptNo}' />");
                return;
            }
            //纳税人识别号
            if(dms.string.isEmpty($('input[name="scanPayTaxPinNo"]').val())){
                dms.notification.info("<spring:message code='sal.lbl.PayTaxPinNo' var='salLblPayTaxPinNo' /><spring:message code='global.info.emptyCheckParam' arguments='${salLblPayTaxPinNo}' />");
                return;
            }
            //购买方名称
            if(dms.string.isEmpty($('input[name="scanCustInfo"]').val())){
                dms.notification.info("<spring:message code='sal.lbl.PurchaseComInfo' var='salLblPurchaseComInfo' /><spring:message code='global.info.emptyCheckParam' arguments='${salLblPurchaseComInfo}' />");
                return;
            }
            
            //CSR 105 机动车统一销售发票提交时对名称校验逗号 贾明 2020-6-8 start
            var scnaInfo = $('input[name="scanCustInfo"]').val();
            if(scnaInfo.indexOf("，") != -1){
                dms.notification.warning("<spring:message code='sal.info.buyerNameCannotHaveCommas' />");
                return;
            }
            if(scnaInfo.indexOf(",") != -1){
               dms.notification.warning("<spring:message code='sal.info.buyerNameCannotHaveCommas' />");
                return;
            } 
            //CSR 105 机动车统一销售发票提交时对名称校验逗号 贾明 2020-6-8 end
            
             //CSR 120  机动车统一销售发票提交时对名称校验双引号(")和逗号(,)，和换行符(\n) 贾明 2020-6-28 start
             if(scnaInfo.indexOf('"') != -1){
                dms.notification.warning("<spring:message code='sal.info.buyerNameCannotHaveDoubleQuotes' />");
                return;
              }
              
              if(scnaInfo.indexOf('“') != -1){
                dms.notification.warning("<spring:message code='sal.info.buyerNameCannotHaveDoubleQuotes' />");
                return;
              }
              if(scnaInfo.indexOf('”') != -1){
                dms.notification.warning("<spring:message code='sal.info.buyerNameCannotHaveDoubleQuotes' />");
                return;
              }
              
              if(scnaInfo.indexOf("'") != -1){
                dms.notification.warning("<spring:message code='sal.info.buyerNameCannotHaveSingleQuotes' />");
                return;
              }
             
              if(scnaInfo.indexOf('‘') != -1){
                dms.notification.warning("<spring:message code='sal.info.buyerNameCannotHaveSingleQuotes' />");
                return;
              }
               if(scnaInfo.indexOf('’') != -1){
                dms.notification.warning("<spring:message code='sal.info.buyerNameCannotHaveSingleQuotes' />");
                return;
              }
             //CSR 120 机动车统一销售发票提交时对名称校验双引号(")和逗号(,)，和换行符(\n) 贾明 2020-6-28 end
            
            //证件号码
            if(dms.string.isEmpty($('input[name="scanSsnCrnNo"]').val())){
                dms.notification.info("<spring:message code='sal.lbl.ssnCrnNo' var='salLblSsnCrnNo' /><spring:message code='global.info.emptyCheckParam' arguments='${salLblSsnCrnNo}' />");
                return;
            }

           //价税合计小写
            if(dms.string.isEmpty($('input[name="scanTaxIncPrice"]').val())){
                dms.notification.info("<spring:message code='sal.lbl.realCarAmts' var='salLblTaxIncludeSumAmtNum' /><spring:message code='global.info.emptyCheckParam' arguments='${salLblTaxIncludeSumAmtNum}' />");
                return;
            }
            //R19080700284 价税合计小写 只能是数字 贾明2019-8-7 start
                 var scanTaxIncPriceVal = $('input[name="scanTaxIncPrice"]').val();
                 var checkTaxIncPriceVal = checkIsError(scanTaxIncPriceVal);
               if('false'==checkTaxIncPriceVal){
                 dms.notification.warning("<spring:message code='sal.lbl.realCarAmts' var='salLblTaxIncludeSumAmtNum' /><spring:message code='global.err.checkQtyParam' arguments='${salLblTaxIncludeSumAmtNum}'/>");
                 return;
               }
            //R19080700284 价税合计小写 只能是数字 贾明2019-8-7 end
             //csr 68 机动车统一发票提交时，开票价字段最初设计允许为负数（上传红票时识别的值），由于业务上不要求经销商上传红票，实际也没有经销商传过红票，因此将这个校验调整，开票价不能为负，并且要大于10000.  贾明 2020-3-20 start  
            if(10000 > parseFloat(scanTaxIncPriceVal) ){
                 dms.notification.warning("<spring:message code='sal.lbl.realCarAmts' /><spring:message code='global.err.amountIncorrect' />");
                 return;
              }
           //csr 68 机动车统一发票提交时，开票价字段最初设计允许为负数（上传红票时识别的值），由于业务上不要求经销商上传红票，实际也没有经销商传过红票，因此将这个校验调整，开票价不能为负，并且要大于10000.  贾明 2020-3-20 end
           
             //不含税价
            if(dms.string.isEmpty($('input[name="scanTaxExcPrice"]').val())){
                dms.notification.info("<spring:message code='sal.lbl.TaxUndercoverageAmt' var='salLblTaxUndercoverageAmt' /><spring:message code='global.info.emptyCheckParam' arguments='${salLblTaxUndercoverageAmt}' />");
                return;
            }
            //R19080700284 不含税价 只能是数字  不含税价如果是0，或1万以下，或大于百万，均提示“金额有误，请修改后再提交”，负数取绝对值对比  贾明2019-8-7 start
                var scanTaxExcPriceVal = $('input[name="scanTaxExcPrice"]').val();
               var checkExeVal = checkIsError(scanTaxExcPriceVal);
               if('false'==checkExeVal){
                 dms.notification.warning("<spring:message code='sal.lbl.TaxUndercoverageAmt' var='salLblTaxUndercoverageAmt' /><spring:message code='global.err.checkQtyParam' arguments='${salLblTaxUndercoverageAmt}'/>");
                 return;
               }
               /** 去掉 此校验 2020-1-13 贾明
               if(10000 > parseFloat(Math.abs(scanTaxExcPriceVal))){
                 dms.notification.warning("<spring:message code='global.err.amountIncorrect' />");
                 return;
               }
               **/
                if(1000000 < parseFloat(Math.abs(scanTaxExcPriceVal))){
                 dms.notification.warning("<spring:message code='global.err.amountIncorrect' />");
                 return;
               }
            //R19080700284 不含税价 只能是数字 ; 不含税价如果是0，或1万以下，或大于百万，均提示“金额有误，请修改后再提交”，负数取绝对值对比 贾明2019-8-7 end
             //CSR 125 机动车统一发票管理在提交时对 不含税价 和 税额 再进行下负数的校验 贾明 2020-7-2 start
              if(0 > scanTaxExcPriceVal){
                dms.notification.warning("<spring:message code='sal.lbl.TaxUndercoverageAmt' var='salLblTaxUndercoverageAmt' /><spring:message code='global.info.cannotNegative' arguments='${salLblTaxUndercoverageAmt}'/>");
                return;
              }
               //CSR 125 机动车统一发票管理在提交时对 不含税价 和 税额 再进行下负数的校验 贾明 2020-7-2 end
            //税率
            if(dms.string.isEmpty($('input[name="scanTaxRate"]').val())){
                dms.notification.info("<spring:message code='sal.lbl.taxRate' var='salLblTaxRate' /><spring:message code='global.info.emptyCheckParam' arguments='${salLblTaxRate}' />");
                return;
            }
            //税额
            if(dms.string.isEmpty($('input[name="scanTaxAmt"]').val())){
                dms.notification.info("<spring:message code='par.lbl.vatAmt' var='parLblVatAmt' /><spring:message code='global.info.emptyCheckParam' arguments='${parLblVatAmt}' />");
                return;
            }
            //R19080700284 税额  只能是数字 贾明2019-8-7 start
             var scanTaxAmtVal = $('input[name="scanTaxAmt"]').val();
               var checkScanTaxAmtVal = checkIsError(scanTaxAmtVal);
               if('false'==checkScanTaxAmtVal){
                 dms.notification.warning("<spring:message code='par.lbl.vatAmt' var='parLblVatAmt' /><spring:message code='global.err.checkQtyParam' arguments='${parLblVatAmt}'/>");
                 return;
               }
            //R19080700284 税额  只能是数字 贾明2019-8-7 start
            
             //CSR 125 机动车统一发票管理在提交时对 不含税价 和 税额 再进行下负数的校验 贾明 2020-7-2 start
              if(0 > scanTaxAmtVal){
                dms.notification.warning("<spring:message code='par.lbl.vatAmt' var='parLblVatAmt' /><spring:message code='global.info.cannotNegative' arguments='${parLblVatAmt}'/>");
                return;
              }
               //CSR 125 机动车统一发票管理在提交时对 不含税价 和 税额 再进行下负数的校验 贾明 2020-7-2 end
             //销货单位名称
            if(dms.string.isEmpty($('input[name="scanSaleCmpnNm"]').val())){
                dms.notification.info("<spring:message code='sal.lbl.SalesComNm' var='salLblSalesComNm' /><spring:message code='global.info.emptyCheckParam' arguments='${salLblSalesComNm}' />");
                return;
            }
            //联系地址
            if(dms.string.isEmpty($('input[name="scanSaleCmpnAddr"]').val())){
                dms.notification.info("<spring:message code='par.lbl.addr' var='parLblAddr' /><spring:message code='global.info.emptyCheckParam' arguments='${parLblAddr}' />");
                return;
            }

            //R19080700284 取不含税价+税额与价税合计小写做对比，如果不相等，则提示 不含税价+税额不等于价税合计  贾明 2019-8-7 start
              if((parseFloat(Math.abs(scanTaxExcPriceVal)) + parseFloat(Math.abs(scanTaxAmtVal)))!=parseFloat(Math.abs(scanTaxIncPriceVal))){
                  dms.notification.warning("<spring:message code='global.err.amountIsNotEqual' />");
                  return;
              };
            //R19080700284 取不含税价+税额与价税合计小写做对比，如果不相等，则提示 不含税价+税额不等于价税合计  贾明 2019-8-7 end
            //csr 63 发票上传界面的手机号输入想要去掉，现在是经销商录入的烦，而且业务 那边也确定说可以不用了 贾明 2020-3-4 start
            /***
            if ($("#telNo").val().length <= 10) {
                 dms.notification.warning("<spring:message code='crm.info.hpno11DigitRequired' />");
                 $("#telNo").focus();
                 return false;
              }
               var myreg = /^1[3456789][0-9]{9}$/;
              if($("#telNo").val().length!=11){
    	    		dms.notification.warning("<spring:message code='crm.info.hpno11DigitRequired' />");
    	    		$("#telNo").focus();
    	    		return false;
    	    	}else{
    	    	   if (!myreg.test($("#telNo").val())) {
    	    		  dms.notification.warning("<spring:message code='crm.info.regExpHpNo' />");
    	    		  $("#telNo").focus();
    	    	      return false;
    	    	    }
    	     }
            ***/
    	     //csr 63 发票上传界面的手机号输入想要去掉，现在是经销商录入的烦，而且业务 那边也确定说可以不用了 贾明 2020-3-4 start
            
             dms.loading.show();
             var updateData = {
                carId:options.sCarId
               ,vinNo:options.sVinNo
               ,scanRcptPubDt:$('#scanRcptPubDt').val()//开票日期
               ,scanRcptCd:$('#scanRcptCd').val()//开票代码
               ,scanRcptNo:$('#scanRcptNo').val()//发票号码
               ,scanPayTaxPinNo:$('#scanPayTaxPinNo').val()//纳税人识别号
               ,scanCustInfo:$('#scanCustInfo').val()//购买方名称
               ,scanSsnCrnNo:$('#scanSsnCrnNo').val()//证件号码
               ,scanTaxIncPrice:$('#scanTaxIncPrice').val()//价税合计小写
               ,scanTaxExcPrice:$('#scanTaxExcPrice').val()//不含税价
               ,scanTaxRate:$('#scanTaxRate').val()//税率
               ,scanTaxAmt:$('#scanTaxAmt').val()//税额
               ,scanSaleCmpnNm:$('#scanSaleCmpnNm').val()//销货单位名称
               ,scanSaleCmpnAddr:$('#scanSaleCmpnAddr').val()//联系地址
               ,telNo:$('#telNo').val()//电话
             }
             console.log("开票日期",updateData);
             
             $.ajax({
                url:"<c:url value='/sal/rcp/updateVehicleUnifiedInvoiceinfo.do' />",
                type:'POST',
                dataType:'json',
                contentType:'application/json',
                data:JSON.stringify(updateData),
                error:function(jqXHR,status,error){
                    dms.loading.hide();
                    if(jqXHR.responseJSON.errors != null && jqXHR.responseJSON.errors.length > 0){
                        dms.notification.error(jqXHR.responseJSON.errors);
                    }else{
                        dms.notification.error(error);
                    }
                },
                success:function(data){
                    dms.loading.hide();
                    //修改成功
                    options.callbackFunc("OK")
                    parent.receiptDetailPopupWindow.close();
                }
            });
            
        }
    });
    //R19080700284 初审回传结果有审核通过/不通过两种，在界面显示为“通过”或“不通过”。当为“不通过”时，进入发票明细界面可进行修改再提交的操作。 贾明2019-8-9 end
    
});

 function getyyyyMMdd(){
    var d = new Date();
    var curr_date = d.getDate();
    var curr_month = d.getMonth() + 1; 
    var curr_year = d.getFullYear();
    String(curr_month).length < 2 ? (curr_month = "0" + curr_month): curr_month;
    String(curr_date).length < 2 ? (curr_date = "0" + curr_date): curr_date;
    var yyyyMMdd = curr_year + "" + curr_month +""+ curr_date;
    return yyyyMMdd;
}
//贾明 R19080700284 不含税价 、税额 、价税合计小写 校验
function checkIsError(val){
    var  checkVal = 'true';
    if(val.length >= 2 ){
           if('00'==val.substr(0,2)){
             checkVal = 'false';
           }else if ('01'==val.substr(0,2)){
              checkVal = 'false';
           }else if ('02'==val.substr(0,2)){
              checkVal = 'false';
           }else if ('03'==val.substr(0,2)){
             checkVal = 'false';
              return checkVal;
           }else if ('04'==val.substr(0,2)){
              checkVal = 'false';
           }else if ('05'==val.substr(0,2)){
              checkVal = 'false';
           }else if ('06'==val.substr(0,2)){
              checkVal = 'false';
           }else if ('07'==val.substr(0,2)){
              checkVal = 'false';
           }else if ('08'==val.substr(0,2)){
              checkVal = 'false';
           }else if ('09'==val.substr(0,2)){
             checkVal = 'false';
           }else if ('--'==val.substr(0,2)){
             checkVal = 'false';
           }else if ('-0'==val.substr(0,2)){
             checkVal = 'false';
           }
      }
      if(val.length >= 3 ){
           if('-00'==val.substr(0,3)){
             checkVal = 'false';
           }else if ('-01'==val.substr(0,3)){
              checkVal = 'false';
           }else if ('-02'==val.substr(0,3)){
              checkVal = 'false';
           }else if ('-03'==val.substr(0,3)){
             checkVal = 'false';
              return checkVal;
           }else if ('-04'==val.substr(0,3)){
              checkVal = 'false';
           }else if ('-05'==val.substr(0,3)){
              checkVal = 'false';
           }else if ('-06'==val.substr(0,3)){
              checkVal = 'false';
           }else if ('-07'==val.substr(0,3)){
              checkVal = 'false';
           }else if ('-08'==val.substr(0,3)){
              checkVal = 'false';
           }else if ('-09'==val.substr(0,3)){
             checkVal = 'false';
           }
      }
      
       if(val.length >= 1){
         //console.log(val.substring(val.length,val.length-1));
          var  xsVal = val.substring(val.length,val.length-1);
          if('.'== xsVal){
            checkVal = 'false';
          }
          if('0' == val ){
             checkVal = 'false';
          }
      }
     
      
      return checkVal;
}    

</script>
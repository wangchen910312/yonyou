<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.sales-1.0.js' />"></script>


<!-- [DMS] 기동차통일영수증관리 -->
<section class="group">
    <div class="header_area">
        <h1 class="title_basic"><spring:message code='sal.title.VehicleCombineReceipt' /></h1>
    </div>

    <!-- 탭메뉴 전체 영역 -->
    <div id="mainTab" class="tab_area">
        <!-- 탭메뉴 -->
        <ul>
            <li id="receiptMgmt" class="k-state-active"><spring:message code='sal.title.ReceiptMgmt' /></li>
            <!-- tangwei 2021/03/29添加 -->
            <li id="receiptScan"><spring:message code='sal.title.ReceiptScan' /></li>
            <li id="receiptUpload"><spring:message code='sal.title.ReceiptUpload' /></li>
        </ul>
        <!-- //탭메뉴 -->


        <!-- 영수증 관리 -->
        <div class="mt0" id="receiptMgmt">
            <section class="group">
                <div class="header_area">
                    <div class="btn_right">
                        <button type="button" class="btn_m btn_search" id="btnSearch" ><spring:message code='global.btn.search' /><!-- 조회 --></button>
                        <button class="btn_m btn_save" id="btnExcel"><spring:message code="global.btn.excelExport" /></button>       <!-- 엑셀 Export -->
                        
                       <!-- R19111100817 保存按钮 去掉 贾明  2019-11-13  hidden button--> <!-- 저장 -->
                       <!-- <button type="button" class="btn_m btn_save" id="btnSave" ><spring:message code='global.btn.save' /></button>-->
                    </div>
                </div>
                <!-- 조회 조건 시작 -->
                <div class="table_form form_width_100per" role="search" data-btnid="btnSearch">
                    <table>
                        <caption></caption>
                        <colgroup>
                            <col style="width:7%;">
                            <col style="width:15%;">
                            <col style="width:7%;">
                            <col style="width:15%;">
                            <col style="width:7%;">
                            <col style="width:15%;">
                            <col style="width:8%;">
                            <col style="width:10%;">
                        </colgroup>
                        <tbody>
                            <tr>
                            	<!-- 车辆识别码-->
                                <th scope="row"><spring:message code="sal.lbl.carVinNo" /></span></th> <!-- VIN -->
                                <td class="required_area">
                                    <input id="sVinNo" name="sVinNo" type="text" class="form_input" maxlength="17" style="text-transform:uppercase;">
                                </td>
                               	<!-- 零售日期 -->
                               	<th scope="row"><spring:message code="sal.lbl.saleDt" /></th>
                                <td>
                                    <div class="form_float">
                                        <div class="date_left">
                                            <input type="text" id="sCustSaleStDt" class="form_datepicker ac" />
                                            <span class="txt_from">~</span>
                                        </div>
                                        <div class="date_right">
                                            <input type="text" id="sCustSaleEdDt" class="form_datepicker ac" />
                                        </div>
                                    </div>
                                </td>
                               	<!-- 状态 隐藏 宫荣枢 2021-04-23 -->
                               	<!--<th scope="row"><spring:message code="global.lbl.statNm" /></th>
                                <td class="required_area">
                                    <input id="sUploadStat" name="sUploadStat" type="text" class="form_comboBox">
                                </td>
                                -->
                            	<!-- 发票来源-->
                                <th scope="row"><spring:message code="sal.lbl.receiptResource" /></th>
                                <td class="required_area">
                                    <input id="sReceiptResource" name="sReceiptResource" type="text" class="form_comboBox">
                                </td>
                            	<!-- 出库店代码-->
                                <th scope="row"><spring:message code="sal.btn.itemOut" /><spring:message code="sal.lbl.trsfDealer" /></th> <!-- 出库店代码 次月复核 R19080700284 贾明 2019-8-8-->
                                <td class="required_area">
                                    <input id="sOrdDlrCd" name="sOrdDlrCd" type="text" class="form_input" maxlength="8" style="text-transform:uppercase;">
                                </td>
                            </tr>
                            <tr>
                            	<!-- 发票号码-->
                                <th scope="row"><spring:message code="sal.lbl.ReceiptNo" /></span></th>
                                <td class="required_area">
                                    <input id="sReceiptNo" name="sReceiptNo" type="text" class="form_input" maxlength="8" >
                                </td>
                                <!-- 开票日期 -->
                                <th scope="row"><spring:message code="sal.lbl.ReceiptPubDt" /></th>
                                <td class="required_area">
                                    <div class="form_float">
                                        <div class="date_left">
                                            <input type="text" id="sReceiptStDt" class="form_datepicker ac" />
                                            <span class="txt_from">~</span>
                                        </div>
                                        <div class="date_right">
                                            <input type="text" id="sReceiptEdDt" class="form_datepicker ac" />
                                        </div>
                                    </div>
                                </td>
                                <!-- 初审 隐藏 宫荣枢 2021-04-23 --> <!-- 初审   R19080700284 贾明 2019-8-8 -->
                                <!--<th scope="row"><spring:message code="sal.lbl.FirstScreen" /></th>
                                <td class="required_area">
                                    <input id="sCertfst" name="sCertfst" type="text" class="form_comboBox">
                                </td>
                                -->
                                <!-- 次月复核 隐藏 宫荣枢 2021-04-23 --> <!-- 上传店代码 次月复核 R19080700284 贾明 2019-8-8-->
                                <!--<th scope="row"><spring:message code="global.btn.upload" /><spring:message code="sal.lbl.trsfDealer" /></th>
                                <td class="required_area">
                                     <input id="sDlrCds" name="sDlrCds" type="text" class="form_input" maxlength="8" style="text-transform:uppercase;">
                                </td>
                                -->
                            	<!-- 发票状态-->
                                <th scope="row"><spring:message code="global.lbl.receipt" /><spring:message code="sal.lbl.statNm" /></th>
                                <td class="required_area">
                                    <input id="sReceiptStatus" name="sReceiptStatus" type="text" class="form_comboBox">
                                </td>
                            	<!-- 开票店代码-->
                                <th scope="row"><spring:message code="sal.lbl.billDealer" /></th>
                                <td class="required_area">
                                    <input id="sDlrCds" name="sDlrCds" type="text" class="form_input" maxlength="8" style="text-transform:uppercase;">
                                </td>
                            </tr>
                            <tr>
                            	<!-- VIN区分 隐藏 宫荣枢 2021-04-23 -->
                            	<!--<th scope="row"><spring:message code="sal,lbl.vinGubun" /></th>
                               	<td class="required_area">
                                    <input id="sVinType" name="sVinType" type="text" class="form_comboBox">
                                </td>
                                -->
                                <!-- 上传日期 隐藏 宫荣枢 2021-04-23 --> <!-- 上传日期-->
                                <!--<th scope="row"><spring:message code="sal.lbl.uploadDt" /></th>
                                <td class="required_area">
                                    <div class="form_float">
                                        <div class="date_left">
                                            <input type="text" id="sUploadStDt" class="form_datepicker ac" />
                                            <span class="txt_from">~</span>
                                        </div>
                                        <div class="date_right">
                                            <input type="text" id="sUploadEdDt" class="form_datepicker ac" />
                                        </div>
                                    </div>
                                </td>
                                -->
                                <!-- 次月复核 隐藏 宫荣枢 2021-04-23 --> <!-- 次月复核 R19080700284 贾明 2019-8-8 -->
                                <!--<th scope="row"><spring:message code="sal.lbl.MonthScreenAgain" /></th>
                                <td class="required_area">
                                    <input id="sCertnd" name="sCertnd" type="text" class="form_comboBox">
                                </td>
                                -->
                                <!-- 申请记录 隐藏 宫荣枢 2021-04-23 --> <!--  R19111100817 增加申请记录 选择项，查询条件 贾明 2019-11-14   start -->
                                <!--<th scope="row"><spring:message code='sal.lbl.applyRecode' /></th>
                                <td>
                                	<label for="sRadioN" class="label_check">
                                         <input type="radio" id="sRadioN" name="sRadio" value="LAST" checked class="form_check" onClick="javascript:changedRadio(false);"/>
                                      <spring:message code='sal.info.last' />
                                    </label> 
                                    <label for="sRadioY" class="label_check">
                                        <input type="radio" id="sRadioY" name="sRadio" value="ALL" class="form_check" onClick="javascript:changedRadio(true);"/>
                                        <spring:message code='sal.info.all' />
                                     </label> 
                                          <input id="appliRecode" name = "appliRecode" type="hidden" value="LAST"/>
                                </td>
                                -->
                                <!--  R19111100817 增加申请记录 选择项，查询条件 贾明 2019-11-14 end-->
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="header_area">
                    <div class="btn_right">
                        
                    </div>
                </div>
                <div class="table_grid">
                    <div id="receiptMgmtGrid" class="resizable_grid"></div>
                </div>
            </section>
        </div>
        <!-- //영수증 관리 -->

		<!-- 增加发票扫码Tab页  TangWei 2021/03/30 -->
		<!-- 发票扫码 -->
        <div class="mt0" id="receiptScan">
            <section class="group">
                <div class="header_area">
                    <div class="btn_right">
                    	<button type="button" class="btn_m btn_search" id="btnSearchScan" ><spring:message code='global.btn.search' /><!-- 조회 查询 --></button>
                        <button type="button" class="btn_m btn_add" id="btnAdd"><spring:message code='global.btn.rowAdd' /><!-- 스캔 --></button>
                        <button type="button" class="btn_m btn_verify" id="btnVerifyScan"><spring:message code='ser.btn.verify' /><!-- 验证 --></button>
                        <button type="button" class="btn_m btn_del" id="btnDel"><spring:message code='global.btn.rowDel' /><!-- 删除 --></button>
                        <button class="btn_m btn_save" id="btnExcelScan"><spring:message code="global.btn.excelExport" /></button>       <!-- 엑셀 Export -->
                    </div>
                </div>
                <!-- 조회 조건 시작 -->
                <div class="table_form form_width_100per" role="search" data-btnid="btnSearchScan">
                    <table>
                        <caption></caption>
                        <colgroup>
                            <col style="width:7%;">
                            <col style="width:15%;">
                            <col style="width:7%;">
                            <col style="width:15%;">
                            <col style="width:7%;">
                            <col style="width:15%;">
                            <col style="width:8%;">
                            <col style="width:10%;">
                        </colgroup>
                        <tbody>
                            <tr>
                            	<!-- 验证状态-->
                                <th scope="row"><spring:message code="sal.lbl.validationStatus" /></th>
                                <td class="required_area">
                                    <input id="sCertfstScan" name="sCertfstScan" type="text" class="form_comboBox">
                                </td>
                                <!-- 开票日期 -->
                                <th scope="row"><spring:message code="sal.lbl.ReceiptPubDt" /></th>
                                <td class="required_area">
                                    <div class="form_float">
                                        <div class="date_left">
                                            <input type="text" id="sReceiptStartDt" class="form_datepicker ac" />
                                            <span class="txt_from">~</span>
                                        </div>
                                        <div class="date_right">
                                            <input type="text" id="sReceiptEndDt" class="form_datepicker ac" />
                                        </div>
                                    </div>
                                </td>
                                <!-- 扫码日期 -->
                                <th scope="row"><spring:message code="sal.lbl.scanDt" /></th>
                                <td class="required_area">
                                    <div class="form_float">
                                        <div class="date_left">
                                            <input type="text" id="sScanStDt" class="form_datepicker ac" />
                                            <span class="txt_from">~</span>
                                        </div>
                                        <div class="date_right">
                                            <input type="text" id="sScanEdDt" class="form_datepicker ac" />
                                        </div>
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="header_area">
                    <div class="btn_right">
                        
                    </div>
                </div>
                <div class="table_grid">
                    <div id="receiptScanGrid" class="resizable_grid"></div>
                </div>
            </section>
        </div>

        <!-- 영수증 업로드-->
        <div class="mt0" id="receiptUpload">
            <section class="group">
                <div class="header_area">
                    <div class="btn_right">
                        <button type="button" class="btn_m btn_search" id="btnScan"><spring:message code='global.btn.scan' /><!-- 스캔 --></button>
                        <button type="button" class="btn_m btn_submit" id="btnSubmit"><spring:message code='global.btn.submit' /><!-- 제출 --></button>
                    </div>
                </div>
                <!-- 조회 조건 시작 -->
                <div class="table_form form_width_100per">
                    <table>
                        <caption></caption>
                        <colgroup>
                            <col style="width:7%;">
                            <col style="width:15%;">
                            <col style="width:7%;">
                            <col style="width:15%;">
                            <col style="width:7%;">
                            <col style="width:25%;">
                            <col>
                            <col style="width:10%;">
                        </colgroup>
                        <tbody>
                            <tr>
                                <th scope="row"><span class="bu_required"><spring:message code='global.lbl.dlrCd' /></span></th> <!-- 딜러코드 -->
                                <td class="readonly_area">
                                    <input id="sDlrCd" name="sDlrCd" type="text" value="${dlrCd}" class="form_input" readonly style="width:30%"/>
                                    <input id="sSearchGubun" name="sSearchGubun" class="form_comboBox" onChange="clearSearchForm()" readonly style="width:68%"/>
                                    <input type="hidden" id="cCarId" name="cCarId"/>
                                    <input type="hidden" id="cVinStat" name="cVinStat"/>
                                </td>
                                <th scope="row"><span class="bu_required"><spring:message code='global.lbl.area' /></span></th> <!-- 지역 -->
                                <td class="required_area">
                                    <input id="sArea" name="sArea" type="text" value="" class="form_comboBox" />
                                </td>
                                <th scope="row"><spring:message code='global.lbl.vinNo' /></th> <!-- VIN-->
                                <td>
                                    <div class="form_float">
                                        <div class="form_left">
                                            <div class="form_search">
                                                <input id="rVinNo" name="rVinNo" class="form_input" maxlength="17" style="text-transform:uppercase;width:100%" />
                                                <a href="javascript:bf_searchVinNo();"></a>       <!-- 검색 -->
                                            </div>
                                        </div>
                                        <div class="form_right">
                                            <input id="cVinNo" name="cVinNo" readonly class="form_input form_readonly" />
                                        </div>
                                    </div>
                                </td>
                                <!-- R19111100817 已报税选择项去掉 贾明 2019-11-14 
                                <th scope="row"><spring:message code='sal.lbl.TaxBeforeReport' /></th> 
                                <td class="required_area">
                                    <input type="checkbox" id="sTaxBeforeChk" name="sTaxBeforeChk" class="form_check" />
                                </td>
                                -->
                            </tr>
                        </tbody>
                    </table>
                </div>
                <br>
                <div class="table_info table_info_v2">
                  <table>
                    <caption></caption>
                    <colgroup>
                        <col style="width:20%;">
                        <col style="width:30%;">
                        <col style="width:25%;">
                        <col style="width:25%;">
                    </colgroup>
                    <tbody>
                        <tr>
                            <th scope="row"><span name="tsSecSpan"><spring:message code="sal.lbl.CarReceiptGubn" /></span></th>
                            <td>
                                <input id="secDlrTp" name="secDlrTp" class="form_comboBox" style="width:90%" />
                            </td>
                            <td class="readonly_area">
                                <input type="text" id="secDlrCd" name="secDlrCd" readonly class="form_input" style="width:90%" />
                            </td>
                            <td class="readonly_area">
                                <input type="text" id="secDlrNm" name="secDlrNm" readonly class="form_input" style="width:90%" />
                            </td>
                        </tr>
                    </tbody>
                 </table>
                </div>
                <br>
                <div class="table_info table_info">
	                <OBJECT classid="clsid:9920E453-32A0-440A-8E57-38D03B5E7094" id="objBillOcr" width="0" height="0"></OBJECT>
	                <form id="IDScanRecog" name="IDScanRecog">
		                <input type="hidden" id="UserID" name="UserID" value="0000FFAE4653FD7BBDC0">
		                <input type="hidden" id="BillType" name="BillType" value="1">
		                <input type="hidden" id="result" name="result">
		                <input type="hidden" id="scanBlob" name="scanBlob" data-json-obj="true">
		                <div class="workProgress_btnArea2 clfix">
		                    <div class="inbox">
		                        <div class="top_area">
		                            <p class="top_txt"><spring:message code='sal.lbl.ScanInfo' /></p>
		                        </div>
		                        <div class="con_area">
		                            <div class="table_info table_info">
		                                <table>
		                                    <caption></caption>
		                                    <colgroup>
		                                        <col style="width:20%;">
		                                        <col style="width:80%;">
		                                    </colgroup>
		                                    <thead>
		                                        <tr>
		                                            <th scope="col"><spring:message code='sal.lbl.Item' /></th>
		                                            <th scope="col"><spring:message code='global.lbl.infoData' /></th>
		                                        </tr>
		                                    </thead>
		                                    <tbody>
		                                        <tr>
		                                            <th scope="col"><spring:message code='global.lbl.FindFile' /></th>
		                                            <td><input type="file" id="scanFile" name="scanFile" value="" class="form_file" /></td>
		                                        </tr>
		                                        <tr>
		                                            <th scope="col"><spring:message code='sal.lbl.targFilePathNm' /></th>
		                                            <td><input type="text" name="scanFileImgDir" style="width:100%;background-color:transparent;text-align:left;border-style:none;" data-json-obj="true" readonly></td>
		                                        </tr>
		                                        <tr>
		                                            <th scope="row"><spring:message code='sal.lbl.ReceiptPubDt' /></th>
		                                            <td><input type="text" id ="scanRcptPubDt" name="scanRcptPubDt" maxlength="10" style="width:100%;background-color:transparent;text-align:left;border-style:none;font-weight:bold;" data-json-obj="true"></td>
		                                        </tr>
		                                        <tr>
		                                            <th scope="row"><spring:message code='sal.lbl.ReceiptCd' /></th><!--R19080700284 发票代码必须是12位的数字，否则提示“发票代码应为12位数字，实际为*位(取发票识别结果的位数显示) 贾明 2019-8-6-->
		                                            <td><input type="text" name="scanRcptCd"  onkeyup="this.value= this.value.match(/\d+(\.\d{0,2})?/) ? this.value.match(/\d+(\.\d{0,2})?/)[0] :''"  maxlength="12" style="width:100%;background-color:transparent;text-align:left;border-style:none;font-weight:bold;" data-json-obj="true"></td>
		                                        </tr>
		                                        <tr>
		                                            <th scope="row"><spring:message code='sal.lbl.rcptNo' /></th><!--R19080700284 发票号必须是8位的数字，否则提示“发票号应为8位数字，实际为*位(取发票识别结果的位数显示)； 如果是8个0的数，也不行 贾明 2019-8-6-->
		                                            <td><input type="text" name="scanRcptNo" maxlength="8" onkeyup="this.value= this.value.match(/\d+(\.\d{0,2})?/) ? this.value.match(/\d+(\.\d{0,2})?/)[0] :''" style="width:100%;background-color:transparent;text-align:left;border-style:none;font-weight:bold;" data-json-obj="true"></td>
		                                        </tr>
		                                        <tr>
		                                            <th scope="row"><spring:message code='sal.lbl.PayTaxPinNo' /></th>
		                                            <td><input type="text" name="scanPayTaxPinNo" maxlength="30" style="width:100%;background-color:transparent;text-align:left;border-style:none;font-weight:bold;" data-json-obj="true"></td>
		                                        </tr>
		                                        <tr>
		                                            <th scope="row"><spring:message code='sal.lbl.PurchaseComInfo' /></th>
		                                            <td><input type="text" name="scanCustInfo" maxlength="70" style="width:100%;background-color:transparent;text-align:left;border-style:none;font-weight:bold;" data-json-obj="true"></td>
		                                        </tr>
		                                        <tr>
		                                            <th scope="row"><spring:message code='sal.lbl.ssnCrnNo' /></th>
		                                            <td><input type="text" name="scanSsnCrnNo" maxlength="50" style="width:100%;background-color:transparent;text-align:left;border-style:none;font-weight:bold;" data-json-obj="true"></td>
		                                        </tr>
		                                        <!-- crs 37 发票上传扫描信息显示的画面，在 证件号码后面增加 手机号码，取合同上的客户手机号，允许修改，校验手机号为11位数字。提交给发票系统，发票初审不通过时可修 贾明 2019-12-11 START-->
		                                        <tr style = "display:none"> <!--csr 63 发票上传界面的手机号输入想要去掉，现在是经销商录入的烦，而且业务 那边也确定说可以不用了 贾明 2020-3-4 -->
		                                            <th scope="row"><spring:message code='ser.lbl.mobilePhone' /><spring:message code='global.lbl.issueNo' /></th>
		                                            <td><input id="telNo" name="telNo" type="text" class="form_input numberic" data-type="mobile" pattern="\d" maxlength="11" data-json-obj="true" style="width:100%;background-color:transparent;text-align:left;border-style:none;font-weight:bold;"/></td>
		                                        </tr>
		                                          <!-- crs 37 发票上传扫描信息显示的画面，在 证件号码后面增加 手机号码，取合同上的客户手机号，允许修改，校验手机号为11位数字。提交给发票系统，发票初审不通过时可修 贾明 2019-12-11 END-->
		                                        <tr>
		                                            <th scope="row"><spring:message code='sal.lbl.carVinNo' /></th>
		                                            <td><input type="text" name="scanVinNo" maxlength="17" style="width:100%;background-color:transparent;text-align:left;border-style:none;font-weight:bold;" data-json-obj="true"></td>
		                                        </tr>
		                                        <tr>
		                                            <th scope="row"><spring:message code='sal.lbl.certNo' /></th>
		                                            <td><input type="text" name="scanCertNo" maxlength="30" style="width:100%;background-color:transparent;text-align:left;border-style:none;" data-json-obj="true"></td>
		                                        </tr>
		                                        <tr>
		                                            <th scope="row"><spring:message code='sal.lbl.engNo' /></th>
		                                            <td><input type="text" name="scanEngNo" maxlength="15" style="width:100%;background-color:transparent;text-align:left;border-style:none;" data-json-obj="true"></td>
		                                        </tr>
		                                        <tr>
		                                            <th scope="row"><spring:message code='sal.lbl.realCarAmts' /></th><!---R19080700284 价税合计小写  贾明 2019-8-7 sal.lbl.TaxIncludeSumAmtNum---> <!--crs 37 价税合计小写 改为  开票价 贾明2019-12-12-->
		                                            <td><input type="text" name="scanTaxIncPrice" onkeyup="this.value=this.value.replace(/[^\- \d.]/g,'')" style="width:100%;background-color:transparent;text-align:left;border-style:none;font-weight:bold;" data-json-obj="true"></td>
		                                        </tr>
		                                        <tr>
		                                            <th scope="row"><spring:message code='sal.lbl.TaxUndercoverageAmt' /></th><!---R19080700284 不含税价只能是数字 贾明 2019-8-7--->
		                                            <td><input type="text" name="scanTaxExcPrice" onkeyup="this.value=this.value.replace(/[^\- \d.]/g,'')" style="width:100%;background-color:transparent;text-align:left;border-style:none;" data-json-obj="true"></td>
		                                        </tr>
		                                        <tr>
		                                            <th scope="row"><spring:message code='sal.lbl.taxRate' /></th>
		                                            <td><input type="text" name="scanTaxRate" maxlength="8" style="width:100%;background-color:transparent;text-align:left;border-style:none;" data-json-obj="true"></td>
		                                        </tr>
		                                        <tr>
		                                            <th scope="row"><spring:message code='par.lbl.vatAmt' /></th><!---R19080700284 税额只能是数字 贾明 2019-8-7--->
		                                            <td><input type="text" name="scanTaxAmt" onkeyup="this.value=this.value.replace(/[^\- \d.]/g,'')" style="width:100%;background-color:transparent;text-align:left;border-style:none;" data-json-obj="true"></td>
		                                        </tr>
		                                        <tr>
		                                            <th scope="row"><spring:message code='sal.lbl.SalesComNm' /></th>
		                                            <td><input type="text" name="scanSaleCmpnNm" maxlength="200" style="width:100%;background-color:transparent;text-align:left;border-style:none;" data-json-obj="true"></td>
		                                        </tr>
		                                        <tr>
		                                            <th scope="row"><spring:message code='par.lbl.addr' /></th>
		                                            <td><input type="text" name="scanSaleCmpnAddr" maxlength="99" style="width:100%;background-color:transparent;text-align:left;border-style:none;" data-json-obj="true"></td>
		                                        </tr>
		                                    </tbody>
		                                </table>
		                            </div>
		                        </div>
		                    </div>
		                    <div class="inbox">
		                        <div class="top_area">
		                            <p class="top_txt"><spring:message code='sal.lbl.ScanImage' /></span></p>
		                        </div>
		                        <div class="con_area">
		                            <img id="scanImageView" src="" style="width:100%;height:507px; display:block;">
		                        </div>
		                    </div>
		                </div>
                    </form>
                    <br>
                </div>
            </section>
        </div>
        <!-- 영수증 업로드-->
    </div>
    <!-- //탭메뉴 전체 영역 -->

</section>

<script type="text/javascript">
var windowHeight = $(window).innerHeight();

/** VIN 조회 팝업 **/
var vinNoSearchPopupWindow;
/** 영수증 명세 팝업 **/
var receiptDetailPopupWindow;
/* tangwei 2021/04/08 发票扫码添加按钮弹出框 */
var receiptScanAddPopupWindow;
/** 영수증 이미지 팝업 **/
var receiptImagePopupWindow;

/** 미업로드 원인 **/
var dstbChnCdList = [];
<c:forEach var="obj" items="${dstbChnCdList}">
    dstbChnCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}"});
</c:forEach>
var dstbChnCdMap = dms.data.arrayToMap(dstbChnCdList, function(obj){ return obj.cmmCd; });

/** VIN구분 **/
var vinGubunList = [];
<c:forEach var="obj" items="${vinGubunList}">
    vinGubunList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}"});
</c:forEach>

/** 업로드상태 **/
var uploadStatList = [];
<c:forEach var="obj" items="${uploadStatList}">
    uploadStatList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}"});
</c:forEach>
var uploadStatCdArr = dms.data.arrayToMap(uploadStatList, function(obj){return obj.cmmCd;});

/** 지역 **/
var arrProvinceInfo = [];
<c:forEach var="obj" items="${arrProvinceInfo}">
    arrProvinceInfo.push({"provinceCd":"${obj.provinceCd}", "provinceNm":"${obj.provinceNm}"});
</c:forEach>

/** tangwei 发票验证状态 **/
var sCertfstScan = [];
<c:forEach var="obj" items="${sCertFst}">
	sCertfstScan.push({"cmmCd":"${obj.cmmCd}","cmmCdNm":"${obj.cmmCdNm}"});
</c:forEach>

// 发票来源 宫荣枢 2021-04-21
var sReceiptResourceArr = [];
<c:forEach var="obj" items="${sReceiptResource}">
	sReceiptResourceArr.push({"cmmCd":"${obj.cmmCd}","cmmCdNm":"${obj.cmmCdNm}"});
</c:forEach>

// 发票状态 宫荣枢 2021-04-21
var sReceiptStatusArr = [];
<c:forEach var="obj" items="${sReceiptStatus}">
	sReceiptStatusArr.push({"cmmCd":"${obj.cmmCd}","cmmCdNm":"${obj.cmmCdNm}"});
</c:forEach>

/** 딜러구분 **/
var searchTpCdList = [];
<c:forEach var="obj" items="${searchTpCdList}">
    searchTpCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
//var searchTpCdArr = dms.data.arrayToMap(searchTpCdList, function(obj){return obj.cmmCd;});

/** 2급유형 리스트 **/
var secDlrGbList = [];
<c:forEach var="obj" items="${secDlrGbDs}">
    secDlrGbList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var secDlrGbMap = dms.data.arrayToMap(secDlrGbList, function(obj){ return obj.cmmCd; });

/** Yes or No **/
var useYnList = [];
<c:forEach var="obj" items="${useYnList}">
    useYnList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}"});
</c:forEach>
var useYnMap = dms.data.arrayToMap(useYnList, function(obj){ return obj.cmmCd; });

/** 증표유무 **/
var existYnList = [];
<c:forEach var="obj" items="${existYnList}">
    existYnList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}"});
</c:forEach>
var existYnMap = dms.data.arrayToMap(existYnList, function(obj){ return obj.cmmCd; });
/** R19080700284 初审 \次月复核查询条件及展示 贾明 2019-8-8  start**/
var applyYnList = [];
<c:forEach var="obj" items="${certYnList}">
   applyYnList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}"});
</c:forEach>
/** R19080700284 初审 、次月复核查询条件及展示 贾明 2019-8-8  end **/
//R19111100817 增加申请记录 选择项，查询条件 贾明 2019-11-14 start
function changedRadio(flg){
   if(flg){
       $("#sRadioY").prop("checked", true);
       $("#appliRecode").val("ALL");
       //$("#grid").data("kendoExtGrid").dataSource.page(1);
   }else{
       $("#sRadioN").prop("checked", true);
       $("#appliRecode").val("LAST");
       //$("#grid").data("kendoExtGrid").dataSource.page(1);
   }
}
//R19111100817 增加申请记录 选择项，查询条件 贾明 2019-11-14 end

/** 심사 통과, 미통과 **/
//var applyYnList = [{"cmmCd":"1", "cmmCdNm":"通过"}, {"cmmCd":"0", "cmmCdNm":"未通过"}, {"cmmCd":"2", "cmmCdNm":"待审批"}];
var applyYnMap = dms.data.arrayToMap(applyYnList, function(obj){ return obj.cmmCd; });

var certFstMap = dms.data.arrayToMap(sCertfstScan, function(obj){ return obj.cmmCd; });
// 发票来源 宫荣枢 2021-04-21
var receiptResourceMap = dms.data.arrayToMap(sReceiptResourceArr, function(obj){ return obj.cmmCd; });
// 发票状态 宫荣枢 2021-04-21
var receiptStatusMap = dms.data.arrayToMap(sReceiptStatusArr, function(obj){ return obj.cmmCd; });

function clearSearchForm(){
    if($("#sSearchGubun").val() == "OD"){   // 타딜러
        $("#sDlrCd").val("");
    }else{
        $("#sDlrCd").val("${dlrCd}");
    }
    $("#cCarId").val("");
    $("#cVinNo").val("");
    $("#cVinStat").val("");
}

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

    uploadStatCdGrid = function(val){
        var returnVal = "";
        if(val != null && val != ""){
            if(uploadStatCdArr[val] != undefined)
            returnVal = uploadStatCdArr[val].cmmCdNm;
        }
        return returnVal;
    };

    $("#mainTab").kendoExtTabStrip({
        animation:false
        , select:function(e) {
            var selectTabId = e.item.id;
            if (selectTabId === "receiptMgmt") {                // 영수증 관리
                $("#receiptMgmtGrid").data("kendoExtGrid").dataSource.page(1);
            } else if (selectTabId === "receiptUpload") {       // 영수증 업로드

            }else{
            	 $("#receiptScanGrid").data("kendoExtGrid").dataSource.page(1);
            };
        }
    });

    $("#sVinType").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:vinGubunList
        ,optionLabel:" "
    });
    //R19080700284 初审、次月复核 查询条件贾明 2019-8-8 start
    $("#sCertfst").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:applyYnList
        ,optionLabel:" "
    });
    $("#sCertnd").kendoExtDropDownList({
         dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:applyYnList
        ,optionLabel:" "
    });
    //R19080700284 初审、次月复核查询条件贾明 2019-8-8 end

    $("#sUploadStat").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:uploadStatList
        ,optionLabel:" "
    });

    /**조회조건 시작일자 **/
    $("#sCustSaleStDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='ser.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,value:"${sFromDt}"
    });

    $("#sCustSaleEdDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='ser.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,value:"${sToDt}"
    });

    $("#sReceiptStDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='ser.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,value:""
    });

    $("#sReceiptEdDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='ser.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,value:""
    });
    
    // 发票扫码 --开票开始日期
    $("#sReceiptStartDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='ser.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,value:""
    });

 	// 发票扫码 --开票结束日期
    $("#sReceiptEndDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='ser.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,value:""
    });

    $("#sUploadStDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='ser.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,value:""
    });

    $("#sUploadEdDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='ser.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,value:""
    });
    
    // 发票扫码开始日期
    $("#sScanStDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='ser.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,value:""
    });
    
 	// 发票扫码结束日期
    $("#sScanEdDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='ser.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,value:""
    });
 	
 	// 发票来源 宫荣枢 2021-04-23
    $("#sReceiptResource").kendoExtDropDownList({
        dataTextField:"cmmCdNm",
        dataValueField:"cmmCd",
        dataSource:sReceiptResourceArr,
        optionLabel:" "
    });
    
 	// 发票状态 宫荣枢 2021-04-23
    $("#sReceiptStatus").kendoExtDropDownList({
        dataTextField:"cmmCdNm",
        dataValueField:"cmmCd",
        dataSource:sReceiptStatusArr,
        optionLabel:" "
    });

    var now = new Date();

    function leadingZeros(n, digits) {
        var zero = '';
        n = n.toString();
        if (n.length < digits) {
            for (i = 0; i < digits - n.length; i++)
                zero += '0';
        }
        return zero + n;
    }

    //$("#sCustSaleStDt").val(leadingZeros(now.getFullYear(), 4) +"-"+ leadingZeros(now.getMonth()+1, 2) +"-"+ "01");
    //$("#sCustSaleEdDt").val(leadingZeros(now.getFullYear(), 4) + leadingZeros(now.getMonth()+1, 2) + leadingZeros(now.getDate(), 2));

    // 조회
    $("#btnSearch").kendoButton({
        click:function(e) {
            $('#receiptMgmtGrid').data('kendoExtGrid').dataSource.page(1);
           }
    });
    
    // tangwei 2021/03/30 发票扫码-查询按钮
    $("#btnSearchScan").kendoButton({
        click:function(e) {
            $('#receiptScanGrid').data('kendoExtGrid').dataSource.page(1);
        }
    });
    
    function refresh() {
    	$('#receiptScanGrid').data('kendoExtGrid').dataSource.page(1);
    }
    
    // tangwei 2021/03/30 添加一行
    /* $("#btnAdd").kendoButton({
        click:function(e) {
            $('#receiptScanGrid').data('kendoExtGrid').dataSource.insert({
				"carId":""
               ,"vinNo":""
               ,"certFst":"待验证" 
               ,"receiptCd":""
               ,"receiptNo":""
               ,"receiptIssDt":""
               ,"sumAmt":0
               ,"scanDt":""
             });
        }
    }); */
    
    // TangWei 2021/04/11 发票扫码页面删除功能
    $("#btnDel").kendoButton({
        click:function(e) {
            var grid = $("#receiptScanGrid").data("kendoExtGrid");
            var rows = grid.select();
            console.log("rows",rows);
            if (rows.length < 1) {
                dms.notification.info("<spring:message code='global.info.required.select'/>");
                return;
            }
            
            var selectedVal = grid.dataItem(grid.select());
            var certFst = selectedVal.certFst;
            console.log("certFst",certFstMap[certFst].cmmCd);
            // 如果验证状态是已通过，则不可以删除
            if ("1" == certFstMap[certFst].cmmCd) {
            	dms.notification.info("<spring:message code='sal.info.receiptPassCanNotDelete'/>");
                return;
            }
            var appReceiptId = selectedVal.appReceiptId;
            dms.window.confirm({
                message:"<spring:message code='global.btn.rowDel' />"
                ,width:300
                ,callback:function(result){
                    if(result){
                    	$.ajax({
                            url:"<c:url value='/sal/rcp/deleteReceiptByAppReceiptId.do' />",
                            type:'POST',
                            dataType:'json',
                            contentType:'application/json',
                            data:JSON.stringify(appReceiptId),
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
                                dms.notification.success("<spring:message code='global.info.success'/>");
                                $('#receiptScanGrid').data('kendoExtGrid').dataSource.page(1);
                            }
                        });
                    }
                }
            });  
        }
    });
    
    // 검색구분
    $("#sSearchGubun").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:searchTpCdList
        ,value : dms.string.isEmpty("${searchGubun}") ? "MD" : "${searchGubun}"
        ,index:1
    });

    // 2급딜러/위성딜러
    $("#secDlrTp").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        //,dataSource:dms.data.cmmCdFilter(secDlrGbList)
        ,optionLabel:" "
        ,enable:false
        ,change:function(e){
            var items = this.dataItem(this.select());
            $("#secDlrCd").val(dms.string.strNvl(items.sdlrCd));
            $("#secDlrNm").val(dms.string.strNvl(items.sdlrNm));
        }
    });

    $("#rVinNo").keypress(function(event){
        if(event.which == 13){
            bf_searchVinNo();
        }else{
            $("#rVinNo").change();
        }
    });

    $("#rVinNo").on('change', fnCheckVin = function(){
        if($("#rVinNo").val() != $("#cVinNo").val() ){
            $("#cVinNo").val("");
            $("#sDlrCd").val("${dlrCd}");
            $("#sSearchGubun").data("kendoExtDropDownList").value("MD");
        }
    });

    //버튼 - 저장
    $("#btnSave").kendoButton({
        click:function(e) {

            var grid = $("#receiptMgmtGrid").data("kendoExtGrid");

            var saveData = grid.getCUDData("insertList", "updateList", "deleteList");

            if (grid.cudDataLength == 0) {
                //변경된 정보가 없습니다.
                dms.notification.info("<spring:message code='global.info.required.change'/>");
                return;
            }

            if (grid.gridValidation()) {
                $.ajax({
                    url:"<c:url value='/sal/rcp/insertSalesVehicleCombineReceiptGridSave.do' />"
                    ,data:JSON.stringify(saveData)
                    ,type:'POST'
                    ,dataType:'json'
                    ,contentType:'application/json'
                    ,error:function(jqXHR, status, error) {
                        if(jqXHR.responseJSON.errors != null && jqXHR.responseJSON.errors.length > 0){
                            dms.notification.error(jqXHR.responseJSON.errors);
                        }else{
                            dms.notification.error(error);
                        }
                    }
                    ,success:function(jqXHR, textStatus) {

                        grid.dataSource._destroyed = [];
                        grid.dataSource.page(1);

                        //정상적으로 반영 되었습니다.
                        dms.notification.success("<spring:message code='global.info.success'/>");
                    }
                });
            }else{
                //입력값을 확인하여 주십시오.
                dms.notification.warning("<spring:message code='global.info.check.input'/>");
            }
        }
    });
    
    // tangwei 2021/04/12 验证按钮
    $("#btnVerifyScan").kendoButton({
        click:function(e) {
            var grid = $("#receiptScanGrid").data("kendoExtGrid");
            var rows = grid.select();
            if (rows.length < 1) {
                dms.notification.info("<spring:message code='global.info.required.select'/>");
                return;
            }  
            var selectedVal = grid.dataItem(grid.select());
            var certFst = selectedVal.certFst;
            console.log("selectedVal",selectedVal);
            var appReceiptId = selectedVal.appReceiptId;
            var receiptNo = selectedVal.receiptNo;
            var receiptCd = selectedVal.receiptCd;
            var receiptIssDt = kendo.toString(selectedVal.receiptIssDt, "yyyy-MM-dd");
            var sumAmt = selectedVal.sumAmt;
            var btnFlag = "1";
            var dataMap = new Object();
            dataMap["receiptCd"] = receiptCd;
            dataMap["receiptNo"] = receiptNo;
            dataMap["receiptPubDt"] = receiptIssDt;
            dataMap["sumAmt"] = sumAmt;
            dataMap["btnFlag"] = btnFlag;
            dataMap["certFst"] = certFst;
            var param = {
                    "dataMap":dataMap
               };  
            // 如果是已通过或者是未通过状态的发票，不允许验证
            if ("0" == certFstMap[certFst].cmmCd || "1" == certFstMap[certFst].cmmCd) {
                dms.notification.info("<spring:message code='sal.info.receiptValiditionCheck'/>");
                return;
            }
            
            $.ajax({
                url:"<c:url value='/sal/rcp/addOrValidaReceiptScan.do' />",
                type:'POST',
                dataType:'json',
                contentType:'application/json',
                data:JSON.stringify(param),
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
                    dms.notification.success("<spring:message code='global.info.success'/>");
                    $('#receiptScanGrid').data('kendoExtGrid').dataSource.page(1);
                }
            });
        }
    });
    
    //버튼 - 엑셀다운로드
    $("#btnExcel").kendoButton({
        click:function(e) {
          console.log("e", $("#sOrdDlrCd").val());
            dms.ajax.excelExport({
            	"beanName":"salesVhclCbinRcitService"
                ,"templateFile":"SalesVhclCbinRcit.xlsx"
                ,"fileName":"<spring:message code='sal.menu.ReceiptScanHistMgmt' />.xlsx"
                ,"sVinNo":$("#sVinNo").val()
                ,"sReceiptNo":$("#sReceiptNo").val()
                //,"sVinType":$("#sVinType").val()
                ,"sCustSaleStDt":kendo.toString($("#sCustSaleStDt").data("kendoExtMaskedDatePicker").value(), "yyyyMMdd")
                ,"sCustSaleEdDt":kendo.toString($("#sCustSaleEdDt").data("kendoExtMaskedDatePicker").value(), "yyyyMMdd")
                //,"sUploadStat":$("#sUploadStat").val()
                //,"sReceiptStDt":kendo.toString($("#sReceiptStDt").data("kendoExtMaskedDatePicker").value(), "yyyyMMdd")
                //,"sReceiptEdDt":kendo.toString($("#sReceiptEdDt").data("kendoExtMaskedDatePicker").value(), "yyyyMMdd")
                //,"sUploadStDt":kendo.toString($("#sUploadStDt").data("kendoExtMaskedDatePicker").value(), "yyyyMMdd")
                //,"sUploadEdDt": kendo.toString($("#sUploadEdDt").data("kendoExtMaskedDatePicker").value(), "yyyyMMdd")
                //,"sCertfst" : $("#sCertfst").val() //R19080700284 初审 、上传店代码 、 次月复核 、出库店代码 查询条件 贾明 2019-8-8 start
                ,"sReceiptResource":$("#sReceiptResource").val()
                ,"sReceiptStatus":$("#sReceiptStatus").val()
                ,"sOrdDlrCd" : $("#sOrdDlrCd").val()
                ,"sDlrCds" : $("#sDlrCds").val()
                //,"sCertnd": $("#sCertnd").val()
                //,"sOrdDlrCd": $("#sOrdDlrCd").val() //R19080700284 初审 、上传店代码 、 次月复核 、出库店代码 查询条件 贾明 2019-8-8 end 
                //,"sAppliRecode": $("#appliRecode").val() //R19111100817 增加申请记录 选择项，查询条件 贾明 2019-11-14 
                ,"exportId":1
            });

        }
    });
    
    // 唐伟  2021/04/06 发票扫码Excel下载
    $("#btnExcelScan").kendoButton({
        click:function(e) {
            dms.ajax.excelExport({
                "beanName":"salesVhclCbinRcitService"
                ,"templateFile":"SalesVhclCbinRcitScan_Tpl.xlsx"
                ,"fileName":"<spring:message code='sal.title.ReceiptScan' />.xlsx"
                ,"certFst":$("#sCertfstScan").val()		// 验证状态
                /* ,"receiptIssDt":kendo.toString($("#sReceiptDt").data("kendoExtMaskedDatePicker").value(), "yyyyMMdd")		// 开票开始日期 */
              	,"sReceiptStDt":kendo.toString($("#sReceiptStartDt").data("kendoExtMaskedDatePicker").value(), "yyyyMMdd")
                ,"sReceiptEdDt":kendo.toString($("#sReceiptEndDt").data("kendoExtMaskedDatePicker").value(), "yyyyMMdd")
                ,"sScanStDt":kendo.toString($("#sScanStDt").data("kendoExtMaskedDatePicker").value(), "yyyyMMdd")		// 扫码日期
                ,"sScanEdDt":kendo.toString($("#sScanEdDt").data("kendoExtMaskedDatePicker").value(), "yyyyMMdd")		// 扫码日期
                ,"exportId":2
            });
        }
    });

    // 영수증 관리 그리드 설정
    $("#receiptMgmtGrid").kendoExtGrid({
        gridId:"G-SAL-0217-123148"
        ,dataSource:{
             transport:{
                read:{
                    url:"<c:url value='/sal/rcp/selectSalesVehicleCombineReceiptSearch.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};

                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        params["sVinNo"] = $("#sVinNo").val();
                        params["sReceiptNo"] = $("#sReceiptNo").val();
                        //params["sVinType"] = $("#sVinType").val();
                        params["sCustSaleStDt"] = $("#sCustSaleStDt").data("kendoExtMaskedDatePicker").value();
                        params["sCustSaleEdDt"] = $("#sCustSaleEdDt").data("kendoExtMaskedDatePicker").value();
                        //params["sUploadStat"] = $("#sUploadStat").val();
                        params["sReceiptStDt"] = $("#sReceiptStDt").data("kendoExtMaskedDatePicker").value();
                        params["sReceiptEdDt"] = $("#sReceiptEdDt").data("kendoExtMaskedDatePicker").value();
                        //params["sUploadStDt"] = $("#sUploadStDt").data("kendoExtMaskedDatePicker").value();
                        //params["sUploadEdDt"] = $("#sUploadEdDt").data("kendoExtMaskedDatePicker").value();
                        //R19080700284 初审 、上传店代码 、 次月复核 、出库店代码 查询条件 贾明 2019-8-8 start
                        //params["sCertfst"] = $("#sCertfst").val();
                        params["sDlrCds"] = $("#sDlrCds").val();
                        //params["sCertnd"] = $("#sCertnd").val();
                        params["sOrdDlrCd"] = $("#sOrdDlrCd").val();
                        //R19111100817 增加申请记录 选择项，查询条件 贾明 2019-11-14 
                        //params["sAppliRecode"] = $("#appliRecode").val();
                        //R19080700284 初审 、上传店代码 、 次月复核 、出库店代码 查询条件 贾明 2019-8-8 end
                        // 宫荣枢 2021-04-23 增加发票来源和发票状态筛选条件
              		    params["sReceiptResource"] = $("#sReceiptResource").val();
              		    params["sReceiptStatus"] = $("#sReceiptStatus").val();
                        return kendo.stringify(params);

                    } else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    };
                }
            }
            ,schema:{
                model:{
                    id:"carId"
                    ,fields:{
                         carId:{type:"string", editable:false }
                        ,vinNo:{type:"string", editable:false }
                        ,dlrCd:{type:"string", editable:false }
                        ,custNm:{type:"string", editable:false }
                        ,custSsnCrnNo:{type:"string", editable:false }
                        ,chkSsnCrnNo:{type:"string", editable:false }
                        ,vinType:{type:"string", editable:false }
                        ,uploadStat:{type:"string", editable:false }
                        ,errUpCd:{type:"string", editable:false }
                        ,taxpayerIdCd:{type:"string", editable:false }
                        ,receiptNo:{type:"string", editable:false }
                        ,receiptCustNm:{type:"string", editable:false }
                        ,ssnCrnNo:{type:"string", editable:false }
                        ,custSaleDt:{type:"date", editable:false}
                        ,receiptIssDt:{type:"date", editable:false}
                        ,regDt:{type:"date", editable:false}
                        ,evalRsltCd:{type:"string", editable:false}
                        ,taxChkYn:{type:"string", editable:false }
                        ,certFst:{type:"string", editable:false }
                        ,cert2nd:{type:"string", editable:false }
                        ,cert3rd:{type:"string", editable:false }
                        ,sdlrCd:{type:"string", editable:false }
                        ,sdlrNm:{type:"string", editable:false }
                        ,sdlrTp:{type:"string", editable:false }
                        ,regUsrId:{type:"string", editable:false }
                        ,addtaxReceiptYn:{type:"string", editable:false }
                        ,addtaxReceiptNo:{type:"string", editable:false }
                        ,receiptItemDesc:{type:"string", editable:false}
                        ,receiptImage:{type:"string", editable:false}
                        ,custSaleDtFormat:{type:"date", editable:false}
                        ,regDtFormat:{type:"date", editable:false}
                        ,ordDlrCd:{type:"string", editable:false }
                        ,carlineNm:{type:"string", editable:false }
                        ,modelNm:{type:"string", editable:false }
                        
                        
                    }
                }

                ,parse:function(d) {
                    if(d.data){
                        $.each(d.data, function(idx, elem) {
                            elem.rnum = d.total - elem.rnum + 1;
                            elem.custSaleDtFormat = kendo.parseDate(elem.custSaleDt, "<dms:configValue code='dateFormat' />");
                            elem.regDtFormat = kendo.parseDate(elem.regDt, "<dms:configValue code='dateFormat' />");
                        });
                    }
                    return d;
                }

            }
        }
        ,height:windowHeight-200
        ,navigatable:true
        ,selectable:"row"
        ,indvColumnVisible:false          //컬럼 보이기/감추기 개인화 적용. default:true
        ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
        ,multiSelectWithCheckbox:false     //멀티선택 적용. default:false
        ,appendEmptyColumn:false           //빈컬럼 적용. default:false
        ,enableTooltip:false               //Tooltip 적용, default:false
        ,sortable:true
        ,editable:false
        ,edit:function(e){
            var grid = $("#receiptMgmtGrid").data("kendoExtGrid");
            var selectedVal = grid.dataItem(grid.select());
            if(!dms.string.isEmpty(selectedVal.receiptNo)){
                this.closeCell();
            }
        }
        ,columns:[
        	/* crs 37 需求 发票明细  和 图片 两列放在 审核情况 字段后面  贾明 2019-12-12  发到最前面 */
            {field:"receiptItemDesc", title:"<spring:message code='sal.lbl.ReceiptItemDesc' />", width:60, sortable:false
                ,attributes:{"class":"ac"}
                ,template:function(dataItem) {
                    if (!dms.string.isEmpty(dataItem.receiptNo)) {
	                    //R19111100817 初审不通过状态，发票明细字段下面的【查询】两个字的按钮，需要显示成【修改】，提交完之后就恢复为【查询】 贾明 2019-11-13 start
	                    // 宫荣枢 2021-05-08 审核状态通过的显示【查询】按钮，非通过的显示【修改】按钮
	                    if (dataItem.certFst=="0") {
	                    	return "<a href='#' class='btnDetail'><span class='txt_label bg_blue'><spring:message code='global.btn.search' /></span></a>";
	                    } else {
	                    	return "<a href='#' class='btnDetail'><span class='txt_label bg_blue'><spring:message code='global.btn.update' /></span></a>";
	                    }
                    }
                    return "";
                }
            }       /* 영수증 명세 */
            ,{field:"receiptImage", title:"<spring:message code='sal.lbl.image' />", width:60, sortable:false
                ,attributes:{"class":"ac"}
                ,template:function(dataItem){
                    if(!dms.string.isEmpty(dataItem.receiptNo)){
                        return "<a href='#' class='btnImage'><span class='txt_label bg_yellow'><spring:message code='global.btn.search' /></span></a>";
                    }
                    return "";
                }
            }       /* 이미지 */
            ,{field:"vinNo", title:"<spring:message code='sal.lbl.carVinNo' />", width:150, attributes:{"class":"ac"}}
            ,{field:"dlrCd", title:"<spring:message code='sal.lbl.billDealer' />", width:100, attributes:{"class":"ac"}}
            ,{field:"ordDlrCd", title:"<spring:message code='sal.btn.itemOut' /><spring:message code='sal.lbl.trsfDealer' />", width:100, attributes:{"class":"ac"}}
            ,{field:"carlineNm", title:"<spring:message code='global.lbl.carYy' />", width:120, sortable:false}
            ,{field:"modelNm", title:"<spring:message code='global.lbl.model' />", width:120, sortable:false}
            ,{field:"msPrc", title:"<spring:message code='sal.lbl.carRetlAmt' />", width:120, attributes:{"class":"ar"},format:"{0:n2}"}
            // 发票状态 宫荣枢 2021-04-21
            ,{field:"receiptStatus", title:"<spring:message code='global.lbl.receipt' /><spring:message code='sal.lbl.statNm' />", width:70, sortable:false
            	, template:"# if(receiptStatusMap[receiptStatus] != null) { # #= receiptStatusMap[receiptStatus].cmmCdNm# # }#"
            }
            // 发票来源 宫荣枢 2021-04-21
            ,{field:"receiptResource", title:"<spring:message code='sal.lbl.receiptResource' />", width:70, sortable:false
            	, template:"# if(receiptResourceMap[receiptResource] != null) { # #= receiptResourceMap[receiptResource].cmmCdNm# # }#"
            }
            ,{field:"custNm", title:"<spring:message code='sal.lbl.publNm' />", width:90,hidden:true}                               /* 고객이름 客户姓名 隐藏 CRS 37 贾明 2019-12-12 */
            ,{field:"custSsnCrnNo", title:"<spring:message code='ser.lbl.certNo' />", width:130,hidden:true}                        /* 고객증서번호  证件号码 隐藏 CRS 37 贾明 2019-12-12 */
            ,{field:"chkSsnCrnNo", title:"<spring:message code='sal.lbl.cmprAcntRcpt' />", width:100, attributes:{"class":"ac"}, sortable:false,hidden:true
                ,template:"# if(useYnMap[chkSsnCrnNo] != null) { # #= useYnMap[chkSsnCrnNo].cmmCdNm# # }#"
            } /* 영수인과 계약인 일치여부购买方与客户证件号码是否一致 隐藏 CRS 37 贾明 2019-12-12*/
            ,{field:"taxpayerIdCd", title:"<spring:message code='sal.lbl.PinNo' />", width:140, sortable:false }		// 纳税人识别号
            ,{field:"receiptNo", title:"<spring:message code='sal.lbl.rcptNo' />", width:80, sortable:false} 
            ,{field:"receiptCd", title:"<spring:message code='sal.lbl.ReceiptCd' />", width:100, sortable:false}        /* 82 dms机动车统一发票管理画面， 发票号码 后面增加  发票代码  贾明 2020-5-6*/
            ,{field:"sumAmt", title:"<spring:message code='sal.lbl.realCarAmts' />", width:80, attributes:{"class":"ar"},format:"{0:n2}"}  /* R19092301299 <机动车统一发票管理>页面（发票管理页卡）的发票号码字段后增加一个价税合计小写字段，即显示车辆的开票价格，下载功能 也要增加 贾明 2019-9-23 sal.lbl.TaxIncludeSumAmtNum 改为开票价  此处要 2019-10-16上线*/
            ,{field:"receiptCustNm", title:"<spring:message code='ser.lbl.rcptPerson' />", width:90, sortable:false}	// 购方
            ,{field:"ssnCrnNo", title:"<spring:message code='ser.lbl.rcptCertNo' />", width:130, sortable:false} 		// 购方税号
            ,{field:"custSaleDt", title:"<spring:message code='sal.lbl.retlDt' />", width:90
                ,format: "{0:<dms:configValue code='dateFormat' />}"
                ,attributes:{"class":"ac"}
            }
            ,{field:"receiptIssDt", title:"<spring:message code='sal.lbl.ReceiptPubDt' />", width:90
                ,attributes:{"class":"ac"}
                ,format: "{0:<dms:configValue code='dateFormat' />}"
            }
            ,{field:"regDtFormat", title:"<spring:message code='sal.lbl.uploadDt' />", width:90, sortable:false
	            ,attributes:{"class":"ac"}
	            ,format: "{0:<dms:configValue code='dateFormat' />}"

            }
         	// 发票验证结果 宫荣枢 2021-04-29
            ,{field:"certFst", title:"<spring:message code='sal.lbl.InvoiceVerificationResult' />", width:100, sortable:false
                , template:"# if(certFstMap[certFst] != null) { # #= certFstMap[certFst].cmmCdNm# # }#"
            }
            ,{
                _field:"_ScreenStatus",
                title: "<spring:message code='sal.info.verificationSituation' />", /* CRS 77 DMS、DCS机动车统一发票管理画面，审核情况改为 验证情况   贾明 2020-4-27심사상황   sal.info.verificationSituation sal.lbl.ScreenStatus */
                headerAttributes:{ "class":"hasBob" },
                columns: [
                   {field: "certFst", title: "<spring:message code='sal.lbl.FirstScreen' />", width: 60, sortable:false, filterable:false
                       , template:"# if(applyYnMap[certFst] != null) { # #= applyYnMap[certFst].cmmCdNm# # }#" } /* 초심 */
                  ,{field: "cert2nd", title: "<spring:message code='sal.lbl.MonthScreenAgain' />", width: 60, sortable:false, filterable:false
                      , template:"# if(applyYnMap[cert2nd] != null) { # #= applyYnMap[cert2nd].cmmCdNm# # }#"  } /* 익월재심 */
                  /*R19111100817 季度复核 不展示,{field: "cert3rd", title: "<spring:message code='sal.lbl.QuarterScreenAgain' />", width: 60, sortable:false, filterable:false
                      , template:"# if(applyYnMap[cert3rd] != null) { # #= applyYnMap[cert3rd].cmmCdNm# # }#"  } 
                  *//* 분기재심 */
                ],
                hidden:true
            }
         	// 隐藏有无增票 宫荣枢 2021-04-21
            ,{field:"addtaxReceiptYn", title:"<spring:message code='sal.lbl.vatRcptYn' />", width:70, attributes:{"class":"ac"}, sortable:false
                , template:"# if(existYnMap[addtaxReceiptYn] != null) { # #= existYnMap[addtaxReceiptYn].cmmCdNm# # }#"
                , hidden:true
            }
            ,{field:"addtaxReceiptNo", title:"<spring:message code='sal.lbl.vatRcptNo' />", width:100, sortable:false, hidden:true}                   /* 증표호增票号 */
             /* crs 37 需求 已报税 删除 即隐藏 贾明 2019-12-12  */
            ,{field:"taxChkYn", title:"<spring:message code='sal.lbl.TaxBeforeReport' />", width:70, attributes:{"class":"ac"}, sortable:false,hidden:true
                ,template:"# if(useYnMap[taxChkYn] != null) { # #= useYnMap[taxChkYn].cmmCdNm# # }#"
            }           /* 세금기신고여부 */

            // 隐藏二网代码、二级网络、二网店名称 宫荣枢 2021-04-21
            ,{field:"sdlrCd", title:"<spring:message code='sal.lbl.lv2Cd' />", width:70, attributes:{"class":"ac"}, sortable:false
                , template:function(dataItem) {
                    if (dataItem.sdlrTp != "EW" && dataItem.sdlrTp != "WX") {
                        return "";
                    } else {
                        return dataItem.sdlrCd;
                    }
                }
            	, hidden:true
            }
            ,{field:"sdlrTp", title:"<spring:message code='sal.lbl.Slv2DlrType' />", width:70, attributes:{"class":"ac"}, sortable:false
                , template:function(dataItem) {
                    if (dataItem.sdlrTp != "EW" && dataItem.sdlrTp != "WX") {
                        return "";
                    } else {
                        return secDlrGbMap[dataItem.sdlrTp].cmmCdNm;
                    }
                }
        		, hidden:true
            }
            ,{field:"sdlrNm", title:"<spring:message code='sal.lbl.sdlrNm' />", width:70, attributes:{"class":"ac"}, sortable:false
                , template:function(dataItem) {
                    if(dataItem.sdlrTp != "EW" && dataItem.sdlrTp != "WX") {
                        return "";
                    } else {
                        return dataItem.sdlrNm;
                    }
                }
        		, hidden:true
            }
            ,{field:"uploadStat", title:"<spring:message code='sal.lbl.statNm' />", width:80, sortable:false
                ,attributes:{"class":"ac"}
                ,template:function(dataItem){
                    var returnObj = "";
                    if(dataItem.uploadStat != undefined){
                        returnObj = uploadStatCdGrid(dataItem.uploadStat);
                    }
                    return returnObj ;
                }
                ,editor:function(container, options) {
                    $('<input name="uploadStat" data-bind="value:' + options.field + '"/>')
                    .appendTo(container)
                    .kendoExtDropDownList({
                        dataSource:uploadStatList
                        ,dataTextField:"cmmCdNm"
                        ,dataValueField:"cmmCd"
                        ,optionLabel:" "
                    })
                    $('<span class="k-invalid-msg" data-for="uploadStat"></span>').appendTo(container);
                }
                , hidden:true
            }       /* 상태 */
            // 隐藏未上传原因、录入人 宫荣枢 2021-04-21
            ,{field:"errUpCd", title:"<spring:message code='sal.lbl.UnUploadCause' />", width:90, sortable:false
                , attributes:{"class":"al"}
                , template:"# if(dstbChnCdMap[errUpCd] != null) { # #= dstbChnCdMap[errUpCd].cmmCdNm# # }#"
                , editor:function(container, options) {
                    $('<input name="errUpCd" data-bind="value:' + options.field + '"/>')
                    .appendTo(container)
                    .kendoExtDropDownList({
                        valuePrimitive:true
                        ,dataSource:dstbChnCdList
                        ,dataTextField:"cmmCdNm"
                        ,dataValueField:"cmmCd"
                        ,optionLabel:" "
                    })
                    $('<span class="k-invalid-msg" data-for="errUpCd"></span>').appendTo(container);
                }
            	, hidden:true
            }
            ,{field:"regUsrId", title:"<spring:message code='global.lbl.regUsrId' />", width:70, sortable:false, hidden:true}                   /* 등록자id */
        ]
    });
    
    // tangwei 2021/03/30 发票扫码表格
    $("#receiptScanGrid").kendoExtGrid({
        gridId:"G-SAL-0217-123149"
        ,dataSource:{
             transport:{
                 read:{
                    url:"<c:url value='/sal/rcp/selectSalesVehicleCombineReceipt.do' />"   
                }
                ,
                parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};

                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

              		    params["certFst"] = $("#sCertfstScan").val();
                        params["sReceiptStDt"] = $("#sReceiptStartDt").data("kendoExtMaskedDatePicker").value();
                        params["sReceiptEdDt"] = $("#sReceiptEndDt").data("kendoExtMaskedDatePicker").value();
                        params["sScanStDt"] = $("#sScanStDt").data("kendoExtMaskedDatePicker").value();
                        params["sScanEdDt"] = $("#sScanEdDt").data("kendoExtMaskedDatePicker").value();
                        return kendo.stringify(params);

                    };
                }
            }
		    ,schema:{
		        model:{
		            id:"appReceiptId"
		            ,fields:{
		                receiptNo:{type:"string", editable:true }
		                ,receiptCd:{type:"string", editable:true }	
		                ,receiptIssDt:{type:"date", editable:true}
		                ,sumAmt:{type:"number", editable:true}
                        ,sCertfst:{type:"string", editable:false }
                        ,scanDt:{type:"date", editable:true}
		            }
		        }
		
		        , parse:function(d) {
		            if (d.data) {
		                $.each(d.data, function(idx, elem) {
		                    elem.rnum = d.total - elem.rnum + 1;
		                    elem.custSaleDtFormat = kendo.parseDate(elem.custSaleDt, "<dms:configValue code='dateFormat' />");
		                    elem.regDtFormat = kendo.parseDate(elem.regDt, "<dms:configValue code='dateFormat' />");
		                });
		            }
		            return d;
		        }
		
		    }
        }
        ,height:windowHeight-200
        ,navigatable:true
        ,selectable:"row"
        ,indvColumnVisible:false          //컬럼 보이기/감추기 개인화 적용. default:true
        ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
        ,multiSelectWithCheckbox:false
        ,multiSelectLocked:false			//멀티선택 적용. default:false
        ,appendEmptyColumn:false           //빈컬럼 적용. default:false
        ,enableTooltip:false               //Tooltip 적용, default:false
        ,sortable:true
        ,editable:true
        ,edit:function(e){
            var grid = $("#receiptScanGrid").data("kendoExtGrid");
            var selectedVal = grid.dataItem(grid.select());
            if(!dms.string.isEmpty(selectedVal.appReceiptId)){
                this.closeCell();
            }
        }
        ,columns:[
        	{field:"appReceiptId", title:"", width:80, sortable:false,hidden:true}		/* 主键id  */
            ,{field:"receiptCd", title:"<spring:message code='sal.lbl.ReceiptCd' />", width:100, sortable:false}		/* 发票代码 */
            ,{field:"receiptNo", title:"<spring:message code='sal.lbl.rcptNo' />", width:80, sortable:false}		/* 发票号码  */
            ,{field:"receiptIssDt", title:"<spring:message code='sal.lbl.ReceiptPubDt' />", width:90, sortable:true
                ,attributes:{"class":"ac"}
                ,format: "{0:<dms:configValue code='dateFormat' />}"

         	 }
            ,{field:"sumAmt", title:"<spring:message code='sal.lbl.realCarAmts' />", width:80, attributes:{"class":"ar"},format:"{0:n2}"}		/* 开票金额  */             
            ,{field:"certFst", title:"<spring:message code='sal.lbl.validationStatus' />", width:70, sortable:true ,editor:function(container, options) {
                $('<input name="certFst" data-bind="value:' + options.field + '"/>')
                .appendTo(container)
                .kendoExtDropDownList({
                    valuePrimitive:true
                    ,dataSource:sCertfstScan
                    ,dataTextField:"cmmCdNm"
                    ,dataValueField:"cmmCdCd"
                    ,optionLabel:" "
                })
                $('<span class="k-invalid-msg" data-for="certFst"></span>').appendTo(container);	
            },template:"# if(certFstMap[certFst] != null) { # #= certFstMap[certFst].cmmCdNm# # }#"}                   /* 验证状态 */
            ,{field:"scanDt", title:"<spring:message code='sal.lbl.scanDt' />", width:90, sortable:false
                ,attributes:{"class":"ac"}
                ,format: "{0:<dms:configValue code='dateFormat' />}"

         	 }
        ]
    });
    
    
    // 영수증 명세 팝업
    $(document).on("click", ".btnDetail", function(e){

        var grid = $("#receiptMgmtGrid").data("kendoExtGrid");
        var rows = grid.select();
        if(rows !== null) {
            var data = [];
            $.each(rows, function(idx, row){
                data.push(grid.dataItem(row));
            });
        }
          console.log("初审",data[0].receiptNo)
        receiptDetailPopupWindow = dms.window.popup({
            windowId:"receiptDetailPopupWindow"
            , title:"<spring:message code='sal.lbl.ReceiptItemDesc' />"
            , modal:true
            , draggable:true
            , height : 300
            , width  : 1000
            , content:{
                url:"<c:url value='/sal/rcp/selectReceiptDetailPopup.do'/>"
                , data:{
                    "autoBind":true
                    , "sCarId":data[0].carId
                    , "sVinNo":data[0].vinNo
                    , "sReceiptNo":data[0].receiptNo //R19111100817 一台车提交了两个不同号的发票，应该显示两行，目前只显示了一行。同时希望可以像<新能源补贴申请审核>页面类似的，可显示全部和最新的数据 贾明 2019-11-11
                    , "sCertFst":data[0].certFst //R19080700284 初审回传结果有审核通过/不通过两种，在界面显示为“通过”或“不通过”。当为“不通过”时，进入发票明细界面可进行修改再提交的操作。 贾明2019-8-9
                    , "callbackFunc":function(data){
                        if("OK"==data){
                          var grid = $("#receiptMgmtGrid").data("kendoExtGrid");
                          grid.dataSource._destroyed = [];
                          grid.dataSource.page(1);
                          dms.notification.success("<spring:message code='global.info.update' var='globalLblUpdate' /><spring:message code='global.info.successMsg' arguments='${globalLblUpdate}' />");
                        }
                         
                    }
                }
            }
        });
    });
    
    
    // tangwei 2021/04/08 发票扫码页面-点击添加按钮弹出框
    $("#btnAdd").kendoButton({
        click:function(e) {
            addReceiptScanPopupWindow();
        }
    });
    
    function addReceiptScanPopupWindow(){
    	receiptScanAddPopupWindow = dms.window.popup({
            windowId:"receiptScanAddPopupWindow"
            , title:"<spring:message code='sal.lbl.addReceipt' />"
            , modal:true
            , draggable:true
            , height : 300
            , width  : 1200
            , content:{
                url:"<c:url value='/sal/rcp/addReceiptScanPopup.do'/>"
            }
        });
    }
    
    // 영수증 이미지 팝업
    $(document).on("click", ".btnImage", function(e){
        var grid = $("#receiptMgmtGrid").data("kendoExtGrid");
        var rows = grid.select();
        if(rows !== null) {
            var data = [];
            $.each(rows, function(idx, row){
                data.push(grid.dataItem(row));
            });
        }

        receiptImagePopupWindow = dms.window.popup({
            windowId:"receiptImagePopupWindow"
            , title:"<spring:message code='sal.lbl.ReceiptItemDesc' />"
            , modal:true
            , draggable:true
            , height : 500
            , width  : 850
            , content:{
                url:"<c:url value='/sal/rcp/selectReceiptImagePopup.do'/>"
                , data:{
                    "autoBind":true
                    , "sCarId":data[0].carId
                    , "sVinNo":data[0].vinNo
                    , "sReceiptNo":data[0].receiptNo //R19111100817 一台车提交了两个不同号的发票，应该显示两行，目前只显示了一行。同时希望可以像<新能源补贴申请审核>页面类似的，可显示全部和最新的数据 贾明 2019-11-11 start
                    , "sParent":"vehicleCombineReceipt"
                    , "callbackFunc":function(data){

                    }
                }
            }
        });
    });

    $("#sArea").kendoExtDropDownList({
         dataSource:arrProvinceInfo
        ,dataTextField:"provinceNm"
        ,dataValueField:"provinceCd"
        ,index:0
    });
    
    // tangwei 2021/03/30 发票验证状态
    $("#sCertfstScan").kendoExtDropDownList({
         dataSource:sCertfstScan
        ,dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,index:3
        ,optionLabel:" "
    });

    // 본딜러 지역정보 설정
    if(dms.string.isNotEmpty("${dealerSungStr}")){
        $("#sArea").data("kendoExtDropDownList").value("${dealerSungStr}");
    }

    // 스캔
    $("#btnScan").kendoButton({
        click:function(e) {
            dms.loading.show();
            ClearInfo();
            document.getElementById("scanFile").value = "";

            // init recogForm (LoadRecogKenal())
            nResult = objBillOcr.InitRecogForm(document.IDScanRecog.UserID.value);
        }
    });

    $("#btnScan").data("kendoButton").bind("click", function(e) {
        setTimeout(function() {
            RecognizeImg();
            dms.loading.hide();
        }, 10);
    });

    // 제출
    $("#btnSubmit").kendoButton({
        click:function(e) {
        //R19092301306 在<机动车统一发票管理>的提交功能中增加对扫描数据“证件号码”的校验。校验规则同客户信息录入模块增加客户时对身份证号的验证。对个人客户，进行身份证号的校验，对公司客户，进行组织机构代码或统一社会信用代码的校验  贾明 2019-9-24 start 
               var scanSsnCrnNoVal = $('input[name="scanSsnCrnNo"]').val();
               //var checkSocCrCodeVal =new Tyshyxdm().verify(scanSsnCrnNoVal); //'91331081307655191L' csr81 目前不做校验  贾明 2020-5-6 
               //checkSocCrCodeVal=checkSocCrCodeVal+"";//csr81 目前不做校验  贾明 2020-5-6 
            //R19092301306 在<机动车统一发票管理>的提交功能中增加对扫描数据“证件号码”的校验。校验规则同客户信息录入模块增加客户时对身份证号的验证。对个人客户，进行身份证号的校验，对公司客户，进行组织机构代码或统一社会信用代码的校验  贾明 2019-9-24 end 
        
        //R19080700284 发票号必须是8位的数字，否则提示“发票号应为8位数字，实际为*位(取发票识别结果的位数显示)； 如果是8个0的数，也不行 贾明 2019-8-6 start
        var scanRcptNoVal = $('input[name="scanRcptNo"]').val();
         if(8!=scanRcptNoVal.length){
                //global.err.invoiceEightNumber   global.err.checkQtyParam
                dms.notification.warning("<spring:message code='global.err.eightNumber' arguments='"+scanRcptNoVal.length+"'/>");
                return;
            }
            if('00000000' == scanRcptNoVal ){
                dms.notification.warning("<spring:message code='global.err.cannotZero'/>");
                return;
            }
        //R19080700284发票号必须是8位的数字，否则提示“发票号应为8位数字，实际为*位(取发票识别结果的位数显示)； 如果是8个0的数，也不行 贾明 2019-8-6 end
        //R19080700284发票代码必须是12位的数字，否则提示“发票代码应为12位数字，实际为*位(取发票识别结果的位数显示)  发票代码的首个数字是1或2， 贾明 2019-8-7 start
             var scanRcptCdVal =  $('input[name="scanRcptCd"]').val();
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
        
        
            // 조회한 VIN
            if($("#cVinNo").val() == ""){
                dms.notification.warning("<spring:message code='sal.lbl.vinInputChkMsg' />")
                return;
            }
            if(document.IDScanRecog.scanVinNo.value == ""){
                dms.notification.warning("<spring:message code='sal.err.noScanInfo' />");
                return;
            }
            if($("#cVinNo").val() != document.IDScanRecog.scanVinNo.value){
                dms.notification.warning("<spring:message code='sal.err.mismatchVin' />");
                return;
            }
            if( dms.string.isEmpty($("#scanBlob").val())
               || dms.string.isEmpty($('input[name="scanFileImgDir"]').val())
            ){
                // 등록된 이미지가 없습니다.
                dms.notification.warning("<spring:message code='sal.info.noimage' />");
                return;
            }

            var regexp =  /^(19|20)\d{2}(0[1-9]|1[012])(0[1-9]|[12][0-9]|3[0-1])$/;
            var value = regexp.test(document.IDScanRecog.scanRcptPubDt.value);

            if(!value){
               //R19080700284日期格式必须符合系统中日期格式的标准，否则提示“日期格式需符合20190526(取当前日期展示)，请修改”  global.err.checkDateValue 贾明 2019-8-7 start
                //dms.notification.warning("<spring:message code='global.err.checkDateValue' />");
                var toadyVal =  getyyyyMMdd();
                dms.notification.warning("<spring:message code='global.err.dateFromatShouldConform' arguments='"+toadyVal+"' />"); 
                //R19080700284日期格式必须符合系统中日期格式的标准，否则提示“日期格式需符合20190526(取当前日期展示)，请修改”  global.err.checkDateValue 贾明 2019-8-7 end
                $("#scanRcptPubDt").focus();
                return;
            }
            
            //----liuxueying update校验开票日期不能大于当前日期 start -----
            var currentDt = getyyyyMMdd();
            if(currentDt < document.IDScanRecog.scanRcptPubDt.value){
                // R19080700284识别出的日期在当前日期之后，提示“日期有误，请修改；贾明 2019-8-7 暂不提交这部分start
            	dms.notification.warning("<spring:message code='global.err.checkDateValue' />");
            	//dms.notification.warning("<spring:message code='global.err.dateIncorrectPleaseAmend' />");
            	 //R19080700284 识别出的日期在当前日期之后，提示“日期有误，请修改；暂不提交这部分 贾明 2019-8-7 end
            	$("#scanRcptPubDt").focus();
            	return; 
            }
            if(dms.string.isEmpty($('input[name="scanTaxIncPrice"]').val())){
                dms.notification.info("<spring:message code='sal.lbl.realCarAmts' var='salLblTaxIncludeSumAmtNum' /><spring:message code='global.info.emptyCheckParam' arguments='${salLblTaxIncludeSumAmtNum}' />");
                return;
            }
            //----liuxueying update校验开票日期不能大于当前日期 end-----------
            //update by lyy 2018-11-06 价税合计小写只能是数字  CRS 37 价税合计小写 改为  开票价 start
            if(!($.isNumeric(document.IDScanRecog.scanTaxIncPrice.value))) {
            	dms.notification.warning("<spring:message code='sal.lbl.realCarAmts' var='salLblTaxIncludeSumAmtNum' /><spring:message code='global.err.checkQtyParam' arguments='${salLblTaxIncludeSumAmtNum}'/>");
                return;
            }
          //update by lyy 2018-11-06 价税合计小写只能是数字 CRS 37 价税合计小写 改为  开票价 end

            if(dms.string.isEmpty($('input[name="scanRcptCd"]').val())){
                dms.notification.info("<spring:message code='sal.lbl.ReceiptCd' var='salLblReceiptCd' /><spring:message code='global.info.emptyCheckParam' arguments='${salLblReceiptCd}' />");
                return;
            }

            if(dms.string.isEmpty($('input[name="scanRcptNo"]').val())){
                dms.notification.info("<spring:message code='sal.lbl.rcptNo' var='salLblRcptNo' /><spring:message code='global.info.emptyCheckParam' arguments='${salLblRcptNo}' />");
                return;
            }

            if(dms.string.isEmpty($('input[name="scanPayTaxPinNo"]').val())){
                dms.notification.info("<spring:message code='sal.lbl.PayTaxPinNo' var='salLblPayTaxPinNo' /><spring:message code='global.info.emptyCheckParam' arguments='${salLblPayTaxPinNo}' />");
                return;
            }

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
            
            //此处
            if(dms.string.isEmpty($('input[name="scanSsnCrnNo"]').val())){
                dms.notification.info("<spring:message code='sal.lbl.ssnCrnNo' var='salLblSsnCrnNo' /><spring:message code='global.info.emptyCheckParam' arguments='${salLblSsnCrnNo}' />");
                return;
            }
            
            
            if(dms.string.isEmpty($('input[name="scanCertNo"]').val())){
                dms.notification.info("<spring:message code='sal.lbl.certNo' var='salLblCertNo' /><spring:message code='global.info.emptyCheckParam' arguments='${salLblCertNo}' />");
                return;
            }

            if(dms.string.isEmpty($('input[name="scanEngNo"]').val())){
                dms.notification.info("<spring:message code='sal.lbl.engNo' var='salLblEngNo' /><spring:message code='global.info.emptyCheckParam' arguments='${salLblEngNo}' />");
                return;
            }
            //R19101701236 发动机编号 输入数据量校验 不能超 15字符 贾明 2019-10-17 start
            if(dms.string.isNotEmpty($('input[name="scanEngNo"]').val())){
                 var  scanEngNoVal= $('input[name="scanEngNo"]').val();
                 var scanEngNoLen= getByteLen(scanEngNoVal);
      			  if(scanEngNoLen > 15){
      			      dms.notification.warning("<spring:message code='sal.info.engineNumMaxCharacter' />");
                      return; 
                 }
                
            }
            //R19101701236 发动机编号 输入数据量校验 不能超 15字符 贾明 2019-10-17 end

            
            //R19080700284 价税合计小写 只能是数字 贾明2019-8-7 CRS 37 价税合计小写 改为  开票价start
                 var scanTaxIncPriceVal = $('input[name="scanTaxIncPrice"]').val();
                 var checkTaxIncPriceVal = checkIsError(scanTaxIncPriceVal);
               if('false'==checkTaxIncPriceVal){
                 dms.notification.warning("<spring:message code='sal.lbl.realCarAmts' var='salLblTaxIncludeSumAmtNum' /><spring:message code='global.err.checkQtyParam' arguments='${salLblTaxIncludeSumAmtNum}'/>");
                 return;
               }
            //R19080700284 价税合计小写 只能是数字 贾明2019-8-7  CRS 37 价税合计小写 改为  开票价 end
            //csr 68 机动车统一发票提交时，开票价字段最初设计允许为负数（上传红票时识别的值），由于业务上不要求经销商上传红票，实际也没有经销商传过红票，因此将这个校验调整，开票价不能为负，并且要大于10000.  贾明 2020-3-20 start  
            if(10000 > parseFloat(scanTaxIncPriceVal) ){
                 dms.notification.warning("<spring:message code='sal.lbl.realCarAmts' /><spring:message code='global.err.amountIncorrect' />");
                 return;
              }
           //csr 68 机动车统一发票提交时，开票价字段最初设计允许为负数（上传红票时识别的值），由于业务上不要求经销商上传红票，实际也没有经销商传过红票，因此将这个校验调整，开票价不能为负，并且要大于10000.  贾明 2020-3-20 end
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
            if(dms.string.isEmpty($('input[name="scanSaleCmpnNm"]').val())){
                dms.notification.info("<spring:message code='sal.lbl.SalesComNm' var='salLblSalesComNm' /><spring:message code='global.info.emptyCheckParam' arguments='${salLblSalesComNm}' />");
                return;
            }

            if(dms.string.isEmpty($('input[name="scanSaleCmpnAddr"]').val())){
                dms.notification.info("<spring:message code='par.lbl.addr' var='parLblAddr' /><spring:message code='global.info.emptyCheckParam' arguments='${parLblAddr}' />");
                return;
            }
            //R19101401320 校验联系地址输入数据 贾明 2019-10-16 start 
            if(dms.string.isNotEmpty($('input[name="scanSaleCmpnAddr"]').val())){
                 var  cmpnAddrVal= $('input[name="scanSaleCmpnAddr"]').val();
                 var addLen= getByteLen(cmpnAddrVal);
                 //var newvalue = scanSaleCmpnAddr.replace(/[^\x00-\xff]/g, "**");
      			  if(addLen > 100){
      			      dms.notification.warning("<spring:message code='sal.info.addreMaxRange' />");
                      return; 
                 }
                
            }
            //R19101401320 校验联系地址输入数据 贾明 2019-10-16 start
            if( $("#secDlrTp").data('kendoExtDropDownList').dataSource.data().length > 1
              && dms.string.isEmpty($("#secDlrTp").data('kendoExtDropDownList').value()) ){
                dms.notification.info("<spring:message code='sal.lbl.CarReceiptGubn' var='salLblCarReceiptGubn' /><spring:message code='global.info.emptyCheckParam' arguments='${salLblCarReceiptGubn}' />");
                return;
            }
            //R19080700284 取不含税价+税额与开票价做对比，如果不相等，则提示 不含税价+税额不等于开票价  贾明 2019-8-7 start
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

            var param = $("#IDScanRecog").serializeObject($("#IDScanRecog").serializeArrayInSelector("[data-json-obj='true']"));
            param.carId = $("#cCarId").val();
            param.vinNo = $("#cVinNo").val();
            param.ordDlrCd = $("#sDlrCd").val();
            param.secDlrCd = $("#secDlrCd").val();
            param.taxBeforeChk = $("#sTaxBeforeChk").prop("checked") == true ? "Y" : "N";
            param.taxSungCd = $("#sArea").data("kendoExtDropDownList").value();
            param.sdlrTp = $("#secDlrTp").data("kendoExtDropDownList").value();
            param.sdlrNm = $("#secDlrNm").val();
            //param.judUnSociCreo = checkSocCrCodeVal; //csr81 目前不做校验  贾明 2020-5-6 
            param.telNo  = $("#telNo").val();//crs 37 发票上传扫描信息显示的画面，在 证件号码 后面增加 手机号码 ，取合同上的客户手机号，允许修改，校验手机号为11位数字。提交给发票系统，发票初审不通过时可修 贾明 2019-12-11 查找合同客户表的电话

            dms.loading.show();
           
            $.ajax({
                url:"<c:url value='/sal/rcp/insertSalesVehicleCombineReceiptSave.do' />",
                type:'POST',
                dataType:'json',
                contentType:'application/json',
                data:JSON.stringify(param),
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

                    // 저장이 완료되었습니다.
                    dms.notification.success("<spring:message code='global.lbl.save' var='globalLblSave' /><spring:message code='global.info.successMsg' arguments='${globalLblSave}' />");
                    $("#rVinNo").val("");
                    $("#cCarId").val("");
                    $("#cVinNo").val("");
                    $("#cVinStat").val("");
                    $("#scanFile").val("");
                    $("#telNo").val("");
                    ClearInfo();
                }
            });
            
       }
    });
    //R19101401320 校验联系地址输入数据 贾明 2019-10-16 start 
    function getByteLen(val) {
            var len = 0;
            for (var i = 0; i < val.length; i++) {
                 var a = val.charAt(i);
                 if (a.match(/[^\x00-\xff]/ig) != null) 
                {
                    len += 2;
                }
                else
                {
                    len += 1;
                }
            }
            return len;
        }
    //R19101401320 校验联系地址输入数据 贾明 2019-10-16 end
  //校验是否满足，身份证号、组织机构代码、统一社会信用代码规则  
 function  checkVerificationNumber(checkSocCrCodeVal,scanSsnCrnNoVal){
      //alert(typeof(checkSocCrCodeVal));
      //var  resBoole = false;
      var param = $("#IDScanRecog").serializeObject($("#IDScanRecog").serializeArrayInSelector("[data-json-obj='true']"));
      // param.scanSsnCrnNo = $("#scanSsnCrnNo").val();
       $.ajax({
                url:"<c:url value='/sal/rcp/selectCheckVerificationNumber.do' />",
                type:'POST',
                dataType:'json',
                contentType:'application/json',
                data:JSON.stringify(param),
                error:function(jqXHR,status,error){
                    dms.loading.hide();
                    if(jqXHR.responseJSON.errors != null && jqXHR.responseJSON.errors.length > 0){
                        dms.notification.error(jqXHR.responseJSON.errors);
                    }else{
                        dms.notification.error(error);
                    }

                },
                success:function(dalist){
                    //alert(checkSocCrCodeVal);
                   if( false == checkSocCrCodeVal && "FALSE"==dalist.data[0].idNumberEigh && "FALSE"==dalist.data[0].idNumberFift && "FALSE"==dalist.data[0].organCode){
                       //alert("数据不对");
                    dms.notification.warning("<spring:message code='crm.info.regExpSsnCrnNo'/>");
                    return;
                   } 
                     console.log("验证数据",dalist.data[0]);
                     //dalist.data[0].idNumberEigh
                     //dalist.data[0].idNumberFift
                     //dalist.data[0].organCode
                     
                }
            });
            console.log("返回值",resBoole);
            //return resBoole;
    
 }
    
    
 //统一社会信用代码
function Tyshyxdm() {
    this.firstarray = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'];
    this.firstkeys = [3, 7, 9, 10, 5, 8, 4, 2];
    this.secondarray = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'J', 'K', 'L', 'M', 'N', 'P', 'Q', 'R', 'T', 'U', 'W', 'X', 'Y'];
    this.secondkeys = [1, 3, 9, 27, 19, 26, 16, 17, 20, 29, 25, 13, 8, 24, 10, 30, 28];
    this.verify = function (str) {
        var code = str.toUpperCase();
 
  /*
        统一代码由十八位的阿拉伯数字或大写英文字母（不使用I、O、Z、S、V）组成。
         第1位：登记管理部门代码（共一位字符）
         第2位：机构类别代码（共一位字符）
         第3位~第8位：登记管理机关行政区划码（共六位阿拉伯数字）
         第9位~第17位：主体标识码（组织机构代码）（共九位字符）
         第18位：校验码​（共一位字符）
  */
        if (code.length != 18) {
            return false;
        }
        var reg = /^\w\w\d{6}\w{9}\w$/;
        if (!reg.test(code)) {
            return false;
        }
   /*
         登记管理部门代码：使用阿拉伯数字或大写英文字母表示。​
         机构编制：1​
         民政：5​
         工商：9​
         其他：Y
   */
        reg = /^[1,5,9,Y]\w\d{6}\w{9}\w$/;
        if (!reg.test(code)) {
            return false;
        }
        /*
         机构类别代码：使用阿拉伯数字或大写英文字母表示。​
         机构编制机关：11打头​​
         机构编制事业单位：12打头​
         机构编制中央编办直接管理机构编制的群众团体：13打头​​
         机构编制其他：19打头​
         民政社会团体：51打头​
         民政民办非企业单位：52打头​
         民政基金会：53打头​
         民政其他：59打头​
         工商企业：91打头​
         工商个体工商户：92打头​
         工商农民专业合作社：93打头​
         其他：Y1打头​
         */
        reg = /^(11|12|13|19|51|52|53|59|91|92|93|Y1)\d{6}\w{9}\w$/;
        if (!reg.test(code)) {
            return false;
        }
        /*
         登记管理机关行政区划码：只能使用阿拉伯数字表示。按照GB/T 2260编码。​
         例如：四川省成都市本级就是510100；四川省自贡市自流井区就是510302。​
        */
        reg = /^(11|12|13|19|51|52|53|59|91|92|93|Y1)\d{6}\w{9}\w$/;
        if (!reg.test(code)) {
            return false;
        }
        /*
             主体标识码（组织机构代码）：使用阿拉伯数字或英文大写字母表示。按照GB 11714编码。
             在实行统一社会信用代码之前，以前的组织机构代码证上的组织机构代码由九位字符组成。格式为XXXXXXXX-Y。前面八位被称为“本体代码”；最后一位被称为“校验码”。校验码和本体代码由一个连字号（-）连接起来。以便让人很容易的看出校验码。但是三证合一后，组织机构的九位字符全部被纳入统一社会信用代码的第9位至第17位，其原有组织机构代码上的连字号不带入统一社会信用代码。
             原有组织机构代码上的“校验码”的计算规则是：​
             例如：某公司的组织机构代码是：59467239-9。那其最后一位的组织机构代码校验码9是如何计算出来的呢？
             第一步：取组织机构代码的前八位本体代码为基数。5 9 4 6 7 2 3 9
             提示：如果本体代码中含有英文大写字母。则A的基数是10，B的基数是11，C的基数是12，依此类推，直到Z的基数是35。
             第二步：​​取加权因子数值。因为组织机构代码的本体代码一共是八位字符。则这八位的加权因子数值从左到右分别是：3、7、9、10、5、8、4、2。​
             第三步：本体代码基数与对应位数的因子数值相乘。​
             5×3＝15，9×7＝63，4×9＝36，6×10＝60，
             7×5＝35，2×8＝16，3×4=12，9×2＝18​​
             第四步：将乘积求和相加。​
             15+63+36+60+35+16+12+18=255
             第五步：​将和数除以11，求余数。​​
             255÷11=33，余数是2。​​
          */
        var firstkey = this.calc(code.substr(8), this.firstarray, this.firstkeys, 11);
        /*
         第六步：用阿拉伯数字11减去余数，得求校验码的数值。当校验码的数值为10时，校验码用英文大写字母X来表示；当校验码的数值为11时，校验码用0来表示；其余求出的校验码数值就用其本身的阿拉伯数字来表示。​
         11-2＝9，因此此公司完整的组织机构代码为 59467239-9。​​
        */
        var firstword;
        if (firstkey < 10) {
            firstword = firstkey;
        }
        if (firstkey == 10) {
            firstword = 'X';
        } else if (firstkey == 11) {
            firstword = '0';
        }
        if (firstword != code.substr(16, 1)) {
            return false;
        }
 
        /*
             校验码：使用阿拉伯数字或大写英文字母来表示。校验码的计算方法参照 GB/T 17710。
             例如：某公司的统一社会信用代码为91512081MA62K0260E，那其最后一位的校验码E是如何计算出来的呢？
             第一步：取统一社会信用代码的前十七位为基数。9 1 5 1 2 0 8 1 21 10 6 2 19 0 2 6 0提示：如果前十七位统一社会信用代码含有英文大写字母（不使用I、O、Z、S、V这五个英文字母）。则英文字母对应的基数分别为：A=10、B=11、C=12、D=13、E=14、F=15、G=16、H=17、J=18、K=19、L=20、M=21、N=22、P=23、Q=24、R=25、T=26、U=27、W=28、X=29、Y=30​
             第二步：​​取加权因子数值。因为统一社会信用代码前面前面有十七位字符。则这十七位的加权因子数值从左到右分别是：1、3、9、27、19、26、16、17、20、29、25、13、8、24、10、30、2​8
             第三步：基数与对应位数的因子数值相乘。​
             9×1=9，1×3=3，5×9=45，1×27=27，2×19=38，0×26=0，8×16=128​
             1×17=17，21×20=420，10×29=290，6×25=150，2×13=26，19×8=152​
             0×23=0，2×10=20，6×30=180，0×28=0
             第四步：将乘积求和相加。​9+3+45+27+38+0+128+17+420+290+150+26+152+0+20+180+0=1495
             第五步：​将和数除以31，求余数。​​
             1495÷31=48，余数是17。​​
        */
 
        var secondkey = this.calc(code, this.secondarray, this.secondkeys, 31);
        /*
         第六步：用阿拉伯数字31减去余数，得求校验码的数值。当校验码的数值为0~9时，就直接用该校验码的数值作为最终的统一社会信用代码的校验码；如果校验码的数值是10~30，则校验码转换为对应的大写英文字母。对应关系为：A=10、B=11、C=12、D=13、E=14、F=15、G=16、H=17、J=18、K=19、L=20、M=21、N=22、P=23、Q=24、R=25、T=26、U=27、W=28、X=29、Y=30
         因为，31-17＝14，所以该公司完整的统一社会信用代码为 91512081MA62K0260E。​​
        */
        var secondword = this.secondarray[secondkey];
        if (!secondword || secondword != code.substr(17, 1)) {
            return false;
        }
        var word = code.substr(0, 16) + firstword + secondword;
        if (code != word) {
            return false;
        }
        return true;
    }
    this.calc = function (code, array1, array2, b) {
        var count = 0;
        for (var i = 0; i < array2.length; i++) {
            var a = code[i];
            count += array2[i] * array1.indexOf(a);
        }
        //return b - count % b;
        var remainder = count % b;
       return remainder === 0 ? 0 : b - remainder;
    }
}


 //统一社会信用代码
function checkSocialCreditCode(Code) {                                                                    
  var patrn = /^[0-9A-Z]+$/;                                                                              
  //18位校验及大写校验 (Code.length != 18) || (patrn.test(Code) == false)                                                                                    
  if (Code.length != 18) {                                               
    console.info("不是有效的统一社会信用编码！2");                                                         
    return false;                                                                                         
  }else {                                                                                                 
    var Ancode;//统一社会信用代码的每一个值                                                               
    var Ancodevalue;//统一社会信用代码每一个值的权重                                                      
    var total = 0;                                                                                        
    var weightedfactors = [1, 3, 9, 27, 19, 26, 16, 17, 20, 29, 25, 13, 8, 24, 10, 30, 28];//加权因子     
    var str = '0123456789ABCDEFGHJKLMNPQRTUWXY';                                                          
    //不用I、O、S、V、Z                                                                                   
    for (var i = 0; i < Code.length - 1; i++) {                                                           
      Ancode = Code.substring(i, i + 1);                                                                  
      Ancodevalue = str.indexOf(Ancode);                                                                  
      total = total + Ancodevalue * weightedfactors[i];                                                   
      //权重与加权因子相乘之和                                                                            
    }                                                                                                     
    var logiccheckcode = 31 - total % 31;                                                                 
    if (logiccheckcode == 31) {                                                                           
      logiccheckcode = 0;                                                                                 
    }                                                                                                     
    var Str = "0,1,2,3,4,5,6,7,8,9,A,B,C,D,E,F,G,H,J,K,L,M,N,P,Q,R,T,U,W,X,Y";                            
    var Array_Str = Str.split(',');                                                                       
    logiccheckcode = Array_Str[logiccheckcode];                                                           
                                                                                                          
                                                                                                          
    var checkcode = Code.substring(17, 18);                                                               
    if (logiccheckcode != checkcode) {                                                                    
      console.info("不是有效的统一社会信用编码！12");                                                       
      return false;                                                                                       
    }else{                                                                                                
      console.info("yes");                                                                                
    }                                                                                                     
    return true;                                                                                          
  }                                                                                                       
 }                                                                                                        

                                                                                                          


    // VIN 정보  조회 팝업
    bf_searchVinNo = function (e){
       var vinNo = dms.string.strNvl($("#rVinNo").val());

       if(dms.string.isEmpty(vinNo)){
           dms.notification.info("<spring:message code='ser.lbl.vinNo' var='vinNo' /><spring:message code='global.info.emptyCheckParam' arguments='${vinNo}' />");
           return;
       } else if(vinNo.length < 6){
           dms.notification.info("<spring:message code='sal.lnfo.chkVinNoLength' />");
           return;
       }

       vinNoSearchPopupWindow = dms.window.popup({
           windowId:"vinNoSearchPopupWindow"
           , title:"<spring:message code = 'ser.title.vinInfo'/>"   // VIN 조회
           , modal:true
           , draggable:false
           , content:{
                   url:"<c:url value='/sal/rcp/selectVinNoSearchPopup.do' />"
                ,data:{
                   "autoBind":true
                   , "type":null
                   , "sVinNo":$("#rVinNo").val()
                   , "sSearchGubun":$("#sSearchGubun").data("kendoExtDropDownList").value()
                   , "callbackFunc":function(data){
                       if(data.length >= 1) {
                           $("#sDlrCd").val(dms.string.strNvl(data[0].dlrCd));
                           if("${dlrCd}" != dms.string.strNvl(data[0].dlrCd)){
                               $("#sSearchGubun").data("kendoExtDropDownList").value("OD");
                           }else{
                               $("#sSearchGubun").data("kendoExtDropDownList").value("MD");
                           }
                           $("#rVinNo").val(data[0].vinNo);
                           $("#cCarId").val(data[0].carId);
                           $("#cVinNo").val(data[0].vinNo);
                           $("#cVinStat").val(data[0].carStatCd);
                           //crs 37 发票上传扫描信息显示的画面，在“证件号码”后面增加“手机号码”，取合同上的客户手机号，允许修改，校验手机号为11位数字。提交给发票系统，发票初审不通过时可修 贾明 2019-12-11 start
                             //data[0].contractNo;
                             if(dms.string.isNotEmpty(data[0].contractNo)){
                                 searchContractTel(data[0].contractNo);
                             }
                             //console.log("我的值",data[0].vinNo);
                             
                              // 
                           //crs 37 发票上传扫描信息显示的画面，在“证件号码”后面增加“手机号码”，取合同上的客户手机号，允许修改，校验手机号为11位数字。提交给发票系统，发票初审不通过时可修 贾明 2019-12-11 end
                            //crs73	机动车统一发票管理提交时增加校验提醒 贾明 2020-4-18 start
                               //var vinNo = data[0].vinNo;
                               obtainAlreadySubmitDataInfo(data[0].vinNo);
                            //crs73	机动车统一发票管理提交时增加校验提醒 贾明 2020-4-18 end
                       }
                       vinNoSearchPopupWindow.close();
                   }
               }
           }
       });

    };
    
    //crs73	机动车统一发票管理提交时增加校验提醒 贾明 2020-4-18 start
    obtainAlreadySubmitDataInfo = function(vinNo){
                       var params = {};

                        params["recordCountPerPage"] = 100;
                        params["pageIndex"] = 1;
                        params["firstIndex"] = 0;
                        params["lastIndex"] = 10000;
                        params["sVinNo"] = vinNo;
                        params["sReceiptNo"] = "";
                        params["sVinType"] = "";
                        params["sCustSaleStDt"] = "";
                        params["sCustSaleEdDt"] = "";
                        params["sUploadStat"] = "";
                        params["sReceiptStDt"] = "";
                        params["sReceiptEdDt"] = "";
                        params["sUploadStDt"] = "";
                        params["sUploadEdDt"] = "";
                        params["sCertfst"] = "";
                        params["sDlrCds"] = "";
                        params["sCertnd"] = "";
                        params["sOrdDlrCd"] = "";
                        params["sAppliRecode"] = "ALL";

           $.ajax({
                url:"<c:url value='/sal/rcp/selectSalesVehicleCombineReceiptSearch.do' />",
                type:'POST',
                dataType:'json',
                contentType:'application/json',
                data:JSON.stringify(params),
                error:function(jqXHR,status,error){
                    dms.loading.hide();

                    if(jqXHR.responseJSON.errors != null && jqXHR.responseJSON.errors.length > 0){
                        dms.notification.error(jqXHR.responseJSON.errors);
                    }else{
                        dms.notification.error(error);
                    }

                },
                success:function(result){
                   //console.log("data的数据",result.data.length);
                   var isRemind = false;
                   for(var i = 0; i < result.data.length; i++) {
                        if('1'==result.data[i].certFst && '1'==result.data[i].cert2nd){
                           isRemind = true;
                        }
                        if('1' == result.data[i].certFst){
                          isRemind = true;
                        }
                     }
                    
                    if(isRemind){
                    
                        popupWindow = dms.window.popup({
                           windowId :"messagePopup"
                          ,title :"<spring:message code='cmm.title.alarmListMng' />"
                          ,width :300
                          ,height:110
                          ,modal:true
                          ,content :{
                          url :"<c:url value='/sal/dlv/newEnergyVSApplication/newEnergyVSApplicationMessagePopup.do' />"
                          ,data :{
                           "type" :null
                            ,"autoBind" :false
                            , msg :"<spring:message code='sal.info.CarNumberUploadConfirmSubmit' arguments='"+vinNo+"'/>"
                            , btnMsg01 :"<spring:message code='global.lbl.yes' />"
                            , btnMsg02 :"<spring:message code='global.lbl.n' />"
                            ,"callbackFunc" :function(data){
                               //console.log("返回值",data);
                               if (data.msg == "02"){
                                  $("#rVinNo").val("");
                                  $("#cVinNo").val("");
                                }
                              }
                            }
                          }
                      });
                    
                    }  
                }
            });
    };
    //crs73	机动车统一发票管理提交时增加校验提醒 贾明 2020-4-18 end

    $('input[name="scanPayTaxPinNo"]').on('change', function(){
        checkSecondDealer({sTaxPayerId:$(this).val()});
    });
    // 2급딜러 정보 조회
    checkSecondDealer = function(jsonData){
        $("#secDlrTp").data("kendoExtDropDownList").setDataSource([]);

        $.ajax({
            url:"<c:url value='/sal/rcp/selectSecondDealerSearch.do' />"
           ,data:JSON.stringify(jsonData)
           ,type:'POST'
           ,dataType:'json'
           ,contentType:'application/json'
           ,error:function(jqXHR, status, error) {
               //dms.notification.error(jqXHR.responseJSON.errors);

               //$("#secDlrTp").data("kendoExtDropDownList").setDataSource(dms.data.cmmCdFilter(secDlrGbList));
               clearSecDlr();
           }
           ,success:function(result , textStatus){
               if(result.data != null){

                   if(result.total > 1){
                       $.each(result.data, function(idx, row){
                           row["cmmCd"] = secDlrGbMap[row.sdlrTp].cmmCd;
                           row["cmmCdNm"] = secDlrGbMap[row.sdlrTp].cmmCdNm+"/"+row.sdlrCd+"/"+row.sdlrNm;
                       });
                       $("#secDlrTp").data("kendoExtDropDownList").setDataSource(result.data);
                       $("#secDlrTp").data("kendoExtDropDownList").enable(true);
                       $("#secDlrTp").data("kendoExtDropDownList").value("");
                       $("span[name='tsSecSpan']").addClass("bu_required");
                       $("#secDlrCd").val("");
                       $("#secDlrNm").val("");

                   }else if(result.total == 1){
                       var dlrTpDs = [{"cmmCd":dms.string.strNvl(secDlrGbMap[result.data[0].sdlrTp].cmmCd)
                                      ,"cmmCdNm":dms.string.strNvl(secDlrGbMap[result.data[0].sdlrTp].cmmCdNm)+"/"+result.data[0].sdlrCd+"/"+result.data[0].sdlrNm}];
                       $("#secDlrTp").data("kendoExtDropDownList").setDataSource(dlrTpDs);
                       $("#secDlrTp").data("kendoExtDropDownList").value(dms.string.strNvl(result.data[0].sdlrTp));
                       $("#secDlrTp").data("kendoExtDropDownList").enable(false);
                       $("span[name='tsSecSpan']").removeClass("bu_required");
                       $("#secDlrCd").val(dms.string.strNvl(result.data[0].sdlrCd));
                       $("#secDlrNm").val(dms.string.strNvl(result.data[0].sdlrNm));

                   }else{
                       clearSecDlr();
                   }

               }else{
                   clearSecDlr();
               }
            }
        });
    };


});

function clearSecDlr(){
    $("#secDlrTp").data("kendoExtDropDownList").value("");
    $("#secDlrTp").data("kendoExtDropDownList").enable(false);
    $("span[name='tsSecSpan']").removeClass("bu_required");
    $("#secDlrCd").val("");
    $("#secDlrNm").val("");
}


//crs 37 查电话号码 发票上传扫描信息显示的画面，在“证件号码”后面增加“手机号码”，取合同上的客户手机号，允许修改，校验手机号为11位数字。提交给发票系统，发票初审不通过时可修 贾明 2019-12-11 start
   searchContractTel = function(conNo){
      $.ajax({
        url:"<c:url value='/sal/rcp/selectContractNoSearchTelDataSearch.do' />"
        ,data:JSON.stringify({sContractNo:conNo})
        ,type:'POST'
        ,dataType:'json'
        ,contentType:'application/json'
        ,async:false
        ,error:function(jqXHR,status,error){
             if(jqXHR.responseJSON.errors != null && jqXHR.responseJSON.errors.length > 0){
                            dms.notification.error(jqXHR.responseJSON.errors);
              }else{
                            dms.notification.error(error);
            }
        }
        ,success:function(data, textStatus){
             console.log("我的值",data.telNo)
             $("#telNo").val(data.telNo);
        }
    });
      
 }
//crs 37 发票上传扫描信息显示的画面，在“证件号码”后面增加“手机号码”，取合同上的客户手机号，允许修改，校验手机号为11位数字。提交给发票系统，发票初审不通过时可修 贾明 2019-12-11 end

// billOcr.OCX 관련 정보 시작
var nResult = -1;
var strResult = "";
var strImageName = "";


function leadingZeros(n, digits) {
    var zero = '';
    n = n.toString();
    if (n.length < digits) {
        for (i = 0; i < digits - n.length; i++)
            zero += '0';
    }
    return zero + n;
}

/*
 * 영수증 스캔
 */
function RecognizeImg() {
    console.log("# scan  start msg  : "+nResult);

    if (nResult == 0) {
        document.IDScanRecog.result.innerText = "Sucess InitRecogForm";
    } else {
        document.IDScanRecog.result.innerText = "Fail InitRecogForm：";
        document.IDScanRecog.result.innerText += nResult;
        if(nResult == '82'){
            dms.notification.error("<spring:message code='sal.err.scan.notConnected' />");
        }else{
            dms.notification.error("<spring:message code='sal.info.FailScan' />" + " : " +nResult);
        }
        $("#scanFile").val("");
        // release recogForm
        objBillOcr.UninitRecogForm();
        return;
    }

    document.IDScanRecog.result.innerText = "";

    objBillOcr.SetFormTypes(document.IDScanRecog.BillType.value, 1);    // 영수증 타입
    objBillOcr.SetDeviceAdvancedParams(2,1);                            // 사이즈
    objBillOcr.SetDeviceAdvancedParams(6,0);                            // 영수증 뒷면 사용
    objBillOcr.SetDeviceAdvancedParams(10,300);                         // 해상도 설정.

    var now = new Date();
    var fileNmDt = leadingZeros(now.getFullYear(), 4) + leadingZeros(now.getMonth()+1, 2) + leadingZeros(now.getDate(), 2);
    var fileNmTm = leadingZeros(now.getHours(), 2) + leadingZeros(now.getMinutes(), 2) + leadingZeros(now.getSeconds(), 2);
    //var imgFileNm = fileNmDt+fileNmTm;
    var imgFileNm = $("#cVinNo").val()+"_"+fileNmDt+fileNmTm;

    var Path = "C:\\ScanInfoImage\\";
    var index = imgFileNm;
    var strEx = ".jpg";
    var ImagePath;
    //var bHavePaper = 1;

    // 여러장 스캔시 필요
    //while(bHavePaper) {
        //index++;
        ImagePath = Path + index + strEx;
        nResult = objBillOcr.AcquireNewImage(ImagePath);

        console.log("# scan AcquireNewImage msg : "+nResult);

        nResult = objBillOcr.RecognizeForm();

        console.log("# scan RecognizeForm msg : "+nResult);

        if (nResult == 0) {

            console.log("# scan ImagePath : "+ImagePath);
            strImageName = ImagePath;
            GetResult();
        }else if(nResult == 10){    // 영수증타입불일치
            dms.notification.error("<spring:message code='sal.err.scan.worongTypeRcpt' />");
        }else{
            dms.notification.error("<spring:message code='sal.err.scan.imageLoadFail' />" + " : " +nResult);
        }
        document.IDScanRecog.result.innerText.value = strResult;
        //bHavePaper = objBillOcr.IsHavePaper();
    //}

    // release recogForm
    objBillOcr.UninitRecogForm();
}

function GetResult() {
    var recogResult = strImageName;
    strResult += recogResult;
    strResult += " - ";
    var nFieldNum = objBillOcr.GetRecogCellCount();
    strResult += nFieldNum + "\r\n";
    if (nFieldNum > 0) {
        for (var i = 0; i < nFieldNum; ++i) {
            strResult += i+ ". ";                      // seq
            strResult += objBillOcr.GetFieldName(i);    // Field Name
            strResult += " : ";
            strResult += objBillOcr.GetRecognizeResult(i);  // Regconize Result
            strResult += "\r\n";
        }
        //console.log("result : "+strResult);
        document.IDScanRecog.scanFileImgDir.value= recogResult;  /* 로컬 이미지 경로 */
        document.IDScanRecog.scanRcptPubDt.value = objBillOcr.GetRecognizeResult(0);        /* 영수증발행일자 */
        document.IDScanRecog.scanRcptCd.value = objBillOcr.GetRecognizeResult(1);       /* 영수증 코드 */
        document.IDScanRecog.scanRcptNo.value = objBillOcr.GetRecognizeResult(2);       /* 영수증번호 */
        document.IDScanRecog.scanCustInfo.value = objBillOcr.GetRecognizeResult(3);       /* 구매처 사람 */
        document.IDScanRecog.scanSsnCrnNo.value = objBillOcr.GetRecognizeResult(4);       /* 기관 코드(증서번호) */
        //document.IDScanRecog.scanxxxxx.value = objBillOcr.GetRecognizeResult(5);       /* 차량 유형 */
        //document.IDScanRecog.scanxxxxx.value = objBillOcr.GetRecognizeResult(6);       /* 창패형호 */
        //document.IDScanRecog.scanxxxxx.value = objBillOcr.GetRecognizeResult(7);       /* 제조지 */
        document.IDScanRecog.scanCertNo.value = objBillOcr.GetRecognizeResult(8);       /* 합격증번호 */
        document.IDScanRecog.scanEngNo.value = objBillOcr.GetRecognizeResult(9);       /* 엔진번호 */
        document.IDScanRecog.scanVinNo.value = objBillOcr.GetRecognizeResult(10);      /* VIN NO */
        document.IDScanRecog.scanTaxIncPrice.value = objBillOcr.GetRecognizeResult(11);      /* 세금포함합계금액숫자 */
        //document.IDScanRecog.scanxxxxx.value = objBillOcr.GetRecognizeResult(12);      /* 수입 원목 */
        //document.IDScanRecog.scanxxxxx.value = objBillOcr.GetRecognizeResult(13);      /* 홀수 번호 홀수 번호 */
        //document.IDScanRecog.scanxxxxx.value = objBillOcr.GetRecognizeResult(14);      /* 관세 합계 */
        document.IDScanRecog.scanSaleCmpnNm.value = objBillOcr.GetRecognizeResult(15);      /* 판매처명칭 */
        //document.IDScanRecog.scanxxxxx.value = objBillOcr.GetRecognizeResult(16);      /* 프린터 코드 */
        //document.IDScanRecog.scanxxxxx.value = objBillOcr.GetRecognizeResult(17);      /* 복사본 */
        //document.IDScanRecog.scanPayTaxPinNo.value = objBillOcr.GetRecognizeResult(18);      /* 납세자식별번호 */
        //document.IDScanRecog.scanxxxxx.value = objBillOcr.GetRecognizeResult(19);      /* 발행인 */
        //document.IDScanRecog.scanxxxxx.value = objBillOcr.GetRecognizeResult(20);      /* 판매처 전화 */
        document.IDScanRecog.scanPayTaxPinNo.value = objBillOcr.GetRecognizeResult(21);      /* 판매 단위 납세자 */
        //document.IDScanRecog.scanxxxxx.value = objBillOcr.GetRecognizeResult(22);      /* 판매 단위 계정 */
        document.IDScanRecog.scanSaleCmpnAddr.value = objBillOcr.GetRecognizeResult(23);      /* 판매처 주소 */
        //document.IDScanRecog.scanxxxxx.value = objBillOcr.GetRecognizeResult(24);      /* 계좌 개설 은행 */
        document.IDScanRecog.scanTaxRate.value = objBillOcr.GetRecognizeResult(25);      /* 부가 가치세율 */
        document.IDScanRecog.scanTaxAmt.value = objBillOcr.GetRecognizeResult(26);      /* 부가 가치세 금액 */
        //document.IDScanRecog.scanxxxxx.value = objBillOcr.GetRecognizeResult(27);      /* 세무 기관 */
        //document.IDScanRecog.scanxxxxx.value = objBillOcr.GetRecognizeResult(28);      /* 세무 기관 코드 */
        document.IDScanRecog.scanTaxExcPrice.value = objBillOcr.GetRecognizeResult(29);      /* 세금미포함금액 */
        //document.IDScanRecog.scanxxxxx.value = objBillOcr.GetRecognizeResult(30);      /* 납세 증명서 */
        //document.IDScanRecog.scanxxxxx.value = objBillOcr.GetRecognizeResult(31);      /* 톤수 */
        //document.IDScanRecog.scanxxxxx.value = objBillOcr.GetRecognizeResult(32);      /* 인원 수를 제한하다. */
        //document.IDScanRecog.scanxxxxx.value = objBillOcr.GetRecognizeResult(33);      /* 코드 */
        //document.IDScanRecog.scanxxxxx.value = objBillOcr.GetRecognizeResult(34);      /* 번호 */

        // base64로 인코딩된 data를 얻어온다.
        var base64ImageData = "data:image/jpg;base64,"+objBillOcr.FileAttrInfor(recogResult);
        document.getElementById("scanImageView").src = base64ImageData;
        $("#scanBlob").val(window.btoa(base64ImageData));

        // 읽어온 납세자 식별변호로 2급/위성 딜러 테이블에서 데이터 조회
        var jsonData = { sTaxPayerId:document.IDScanRecog.scanPayTaxPinNo.value };
        checkSecondDealer(jsonData);

        dms.notification.info("<spring:message code='sal.info.scanSuccess' />");
    }
}

function ClearInfo(){
    $("#secDlrTp").data("kendoExtDropDownList").setDataSource([]);
    clearSecDlr();

    document.IDScanRecog.scanFileImgDir.value= "";  /* 로컬 이미지 경로 */
    document.IDScanRecog.scanRcptPubDt.value = "";        /* 영수증발행일자 */
    document.IDScanRecog.scanRcptCd.value = "";       /* 영수증 코드 */
    document.IDScanRecog.scanRcptNo.value = "";       /* 영수증번호 */
    document.IDScanRecog.scanCustInfo.value = "";       /* 구매처 사람 */
    document.IDScanRecog.scanSsnCrnNo.value = "";      /* 기관 코드(증서번호) */
    document.IDScanRecog.scanCertNo.value = "";       /* 합격증번호 */
    document.IDScanRecog.scanEngNo.value = "";       /* 엔진번호 */
    document.IDScanRecog.scanVinNo.value = "";
    document.IDScanRecog.scanTaxIncPrice.value = "";      /* 세금포함합계금액숫자 */
    document.IDScanRecog.scanSaleCmpnNm.value = "";      /* 판매처명칭 */
    document.IDScanRecog.scanPayTaxPinNo.value = "";      /* 판매 단위 납세자 */
    document.IDScanRecog.scanSaleCmpnAddr.value = "";      /* 판매처 주소 */
    document.IDScanRecog.scanTaxRate.value = "";      /* 부가 가치세율 */
    document.IDScanRecog.scanTaxAmt.value = "";      /* 부가 가치세 금액 */
    document.IDScanRecog.scanTaxExcPrice.value = "";      /* 세금미포함금액 */

    document.IDScanRecog.scanBlob.value= "";
    document.getElementById("scanImageView").src = "";

}

//input files Listener
document.getElementById("scanFile").addEventListener('change', handleFileSelect, false);

//file Handler Func
function handleFileSelect(evt){
    ClearInfo();

    //input files
    var files = evt.target.files;
    if(files == null || files.length == 0){
        return false;
    }

    //fileView
    var fileView = document.querySelector("img");

    console.log("# select files #");
    console.log("#files : "+files[0].name);
    console.log("#files size : "+files[0].size);
    console.log("#files type : "+files[0].type);

    var fileNm = dms.string.strNvl(files[0].name);
    var fileTp = fileNm.slice(fileNm.indexOf(".")+1).toLowerCase();
    if(fileTp != "gif" && fileTp != "png" && fileTp != "jpg" && fileTp != "jpeg"){
        $("#scanFile").val("");
        //이미지 파일만 업로드 가능합니다.(jpg, jpeg, gif, png)
        dms.notification.info("<spring:message code='global.info.fileTpImgYn'/>");
        return false;
    }

    if(Number(dms.string.strNvl(files[0].size)) >= 10485760){
        // 첨부파일은 10MB를 초과 할 수 없습니다.
        dms.notification.warning("<spring:message code='sal.info.helpCarFileSize' arguments='10' />");
        return false;
    }


    for(var i = 0,f; f = files[i]; i++){
        //file only one.
        if(i < 1){
            //FileReader
            /*
            var reader = new FileReader();
            var file = f;
            reader.onload = (function(theFile) {
                return function(e) {

                    var image01 = new Image();
                    image01.src = e.target.result;

                    image01.onload = function() {

                        if(this.width > 300){
                            fileView.width = 300;
                        }else{
                            fileView.width = this.width;
                        }
                    };
                    $("#scanBlob").val(window.btoa(e.target.result));
                    fileView.src = e.target.result;
                };
            })(file);
            //readAsDataURL call
            reader.readAsDataURL(file);
            RecognizeJpg(document.IDScanRecog.scanFile.value);
            */

            var reader = new FileReader();
            reader.onload = function(e) {
                $(fileView).attr("src", e.target.result);

                fileView.onload = function() {
                    if(this.width <= this.naturalWidth){
                        $(this).css("width", this.width);
                    }else{
                        $(this).css("width", this.width);
                    }
                };
                $("#scanBlob").val(window.btoa(e.target.result));

                dms.loading.show();
                nResult = objBillOcr.InitRecogForm(document.IDScanRecog.UserID.value);
                setTimeout(function() {
                    RecognizeJpg(document.IDScanRecog.scanFile.value);
                    dms.loading.hide();
                }, 10);

            };
            //readAsDataURL call
            reader.readAsDataURL(f);
        }
    }
}

/*
 * 영수증 이미지파일로 읽을때 사용
 */
function RecognizeJpg(fileName) {

    if (nResult == 0) {
        document.IDScanRecog.result.innerText = "Sucess InitRecogForm";
    } else {
        document.IDScanRecog.result.innerText = "Fail InitRecogForm：";
        document.IDScanRecog.result.innerText += nResult;
        if(nResult == '82'){
            dms.notification.error("<spring:message code='sal.err.scan.notConnected' />");
        }else{
            dms.notification.error("<spring:message code='sal.info.FailScan' />" + " : " +nResult);
        }
        $("#scanFile").val("");
        objBillOcr.UninitRecogForm();
        return;
    }

    console.log("# file Search file Name : "+fileName);

    document.IDScanRecog.result.innerText = "";

    objBillOcr.SetFormTypes(document.IDScanRecog.BillType.value, 1);    // 영수증 타입(1 : 기동차 영수증)
    objBillOcr.SetDeviceAdvancedParams(2,1);                            // 사이즈
    objBillOcr.SetDeviceAdvancedParams(6,0);                            // 영수증 뒷면 사용여부
    objBillOcr.SetDeviceAdvancedParams(10,300);                         // 해상도 설정

    var ImagePath = fileName;

    var loadRtn = objBillOcr.LoadImages(ImagePath);

    if(loadRtn == 0){
        nResult = objBillOcr.RecognizeForm();
        if(nResult == 0){
            strImageName = ImagePath;
            GetResultImg();
        }else if(nResult == 10){    // 영수증타입불일치
            dms.notification.error("<spring:message code='sal.err.scan.worongTypeRcpt' />");
        }else{
            dms.notification.error("<spring:message code='sal.err.scan.imageLoadFail' />" + " : " +nResult);
        }
    }

    // release recogForm
    objBillOcr.UninitRecogForm();
}

function GetResultImg() {
    var recogResult = strImageName;
    strResult += recogResult;
    strResult += " - ";
    var nFieldNum = objBillOcr.GetRecogCellCount();
    strResult += nFieldNum + "\r\n";
    if (nFieldNum > 0) {
        for (var i = 0; i < nFieldNum; ++i) {
            strResult += i+ ". ";                      // seq
            strResult += objBillOcr.GetFieldName(i);    // Field Name
            strResult += " : ";
            strResult += objBillOcr.GetRecognizeResult(i);  // Regconize Result
            strResult += "\r\n";
        }
        //console.log("result : "+strResult);
        document.IDScanRecog.scanFileImgDir.value= recogResult;  /* 로컬 이미지 경로 */
        document.IDScanRecog.scanRcptPubDt.value = objBillOcr.GetRecognizeResult(0);        /* 영수증발행일자 */
        document.IDScanRecog.scanRcptCd.value = objBillOcr.GetRecognizeResult(1);       /* 영수증 코드 */
        document.IDScanRecog.scanRcptNo.value = objBillOcr.GetRecognizeResult(2);       /* 영수증번호 */
        document.IDScanRecog.scanCustInfo.value = objBillOcr.GetRecognizeResult(3);       /* 구매처 사람 */
        document.IDScanRecog.scanSsnCrnNo.value = objBillOcr.GetRecognizeResult(4);       /* 기관 코드(증서번호) */
        //document.IDScanRecog.scanxxxxx.value = objBillOcr.GetRecognizeResult(5);       /* 차량 유형 */
        //document.IDScanRecog.scanxxxxx.value = objBillOcr.GetRecognizeResult(6);       /* 창패형호 */
        //document.IDScanRecog.scanxxxxx.value = objBillOcr.GetRecognizeResult(7);       /* 제조지 */
        document.IDScanRecog.scanCertNo.value = objBillOcr.GetRecognizeResult(8);       /* 합격증번호 */
        document.IDScanRecog.scanEngNo.value = objBillOcr.GetRecognizeResult(9);       /* 엔진번호 */
        document.IDScanRecog.scanVinNo.value = objBillOcr.GetRecognizeResult(10);      /* VIN NO */
        document.IDScanRecog.scanTaxIncPrice.value = objBillOcr.GetRecognizeResult(11);      /* 세금포함합계금액숫자 */
        //document.IDScanRecog.scanxxxxx.value = objBillOcr.GetRecognizeResult(12);      /* 수입 원목 */
        //document.IDScanRecog.scanxxxxx.value = objBillOcr.GetRecognizeResult(13);      /* 홀수 번호 홀수 번호 */
        //document.IDScanRecog.scanxxxxx.value = objBillOcr.GetRecognizeResult(14);      /* 관세 합계 */
        document.IDScanRecog.scanSaleCmpnNm.value = objBillOcr.GetRecognizeResult(15);      /* 판매처명칭 */
        //document.IDScanRecog.scanxxxxx.value = objBillOcr.GetRecognizeResult(16);      /* 프린터 코드 */
        //document.IDScanRecog.scanxxxxx.value = objBillOcr.GetRecognizeResult(17);      /* 복사본 */
        //document.IDScanRecog.scanPayTaxPinNo.value = objBillOcr.GetRecognizeResult(18);      /* 납세자식별번호 */
        //document.IDScanRecog.scanxxxxx.value = objBillOcr.GetRecognizeResult(19);      /* 발행인 */
        //document.IDScanRecog.scanxxxxx.value = objBillOcr.GetRecognizeResult(20);      /* 판매처 전화 */
        document.IDScanRecog.scanPayTaxPinNo.value = objBillOcr.GetRecognizeResult(21);      /* 판매 단위 납세자 */
        //document.IDScanRecog.scanxxxxx.value = objBillOcr.GetRecognizeResult(22);      /* 판매 단위 계정 */
        document.IDScanRecog.scanSaleCmpnAddr.value = objBillOcr.GetRecognizeResult(23);      /* 판매처 주소 */
        //document.IDScanRecog.scanxxxxx.value = objBillOcr.GetRecognizeResult(24);      /* 계좌 개설 은행 */
        document.IDScanRecog.scanTaxRate.value = objBillOcr.GetRecognizeResult(25);      /* 부가 가치세율 */
        document.IDScanRecog.scanTaxAmt.value = objBillOcr.GetRecognizeResult(26);      /* 부가 가치세 금액 */
        //document.IDScanRecog.scanxxxxx.value = objBillOcr.GetRecognizeResult(27);      /* 세무 기관 */
        //document.IDScanRecog.scanxxxxx.value = objBillOcr.GetRecognizeResult(28);      /* 세무 기관 코드 */
        document.IDScanRecog.scanTaxExcPrice.value = objBillOcr.GetRecognizeResult(29);      /* 세금미포함금액 */
        //document.IDScanRecog.scanxxxxx.value = objBillOcr.GetRecognizeResult(30);      /* 납세 증명서 */
        //document.IDScanRecog.scanxxxxx.value = objBillOcr.GetRecognizeResult(31);      /* 톤수 */
        //document.IDScanRecog.scanxxxxx.value = objBillOcr.GetRecognizeResult(32);      /* 인원 수를 제한하다. */
        //document.IDScanRecog.scanxxxxx.value = objBillOcr.GetRecognizeResult(33);      /* 코드 */
        //document.IDScanRecog.scanxxxxx.value = objBillOcr.GetRecognizeResult(34);      /* 번호 */

        // 읽어온 납세자 식별변호로 2급/위성 딜러 테이블에서 데이터 조회
        var jsonData = { sTaxPayerId:document.IDScanRecog.scanPayTaxPinNo.value };
        checkSecondDealer(jsonData);

        dms.notification.info("<spring:message code='sal.info.scanSuccess' />");
    }
}
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
 // billOcr.OCX 관련 정보 끝

</script>
<!-- [DMS] 기동차통일영수증관리 -->
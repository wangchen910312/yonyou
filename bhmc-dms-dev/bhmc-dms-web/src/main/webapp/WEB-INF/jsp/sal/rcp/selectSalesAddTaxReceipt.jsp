<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- [DMS] 부가세영수증관리 -->
<section class="group">
    <div class="header_area">
        <h1 class="title_basic"><spring:message code='sal.title.AddTaxReceipt' /></h1>
    </div>

    <!-- 탭메뉴 전체 영역 -->
    <div id="mainTab" class="tab_area">
        <!-- 탭메뉴 -->
        <ul>
            <%-- <li id="addtaxReceiptMgmt" class="k-state-active"><spring:message code='sal.title.AddTaxReceiptMgmt' /></li> --%>
            <li id="addtaxReceiptMgmt" class="k-state-active"><spring:message code='sal.title.AddTaxReceiptDetail' /></li>
            <li id="addtaxReceiptUpload"><spring:message code='sal.title.AddTaxReceiptUpload' /></li>
            <li id="bindingVin"><spring:message code='sal.title.BindingFrameNumber' /></li>
        </ul>
        <!-- //탭메뉴 -->


        <!-- 부가세 영수증 관리 -->
        <div class="mt0" id="addtaxReceiptMgmt">
            <section class="group">
                <div class="header_area">
                    <div class="btn_right">
                        <button type="button" class="btn_s btn_search" id="btnSearch" ><spring:message code='global.btn.search' /><!-- 조회 --></button>
                        <button type="button" class="btn_s btn_search" id="unbundling" ><spring:message code='sal.title.Unbundling' /></button>
                    </div>
                </div>
                <!-- 조회 조건 시작 -->
                <div class="table_form form_width_100per" role="search" data-btnid="btnSearch">
                    <table>
                        <caption></caption>
                        <colgroup>
                            <col style="width:9%;">
                            <col style="width:12%;">
                            <col style="width:9%;">
                            <col style="width:12%;">
                            <col style="width:9%;">
                            <col style="width:17%;">
                            <col style="width:9%;">
                            <col style="width:17%;">
                        </colgroup>
                        <tbody>
                            <tr>
                                <th scope="row"><spring:message code="global.lbl.vinNo" /></span></th> <!-- VIN -->
                                <td class="required_area">
                                    <input id="sVinNo" name="sVinNo" type="text" class="form_input" maxlength="17" style="text-transform:uppercase;">
                                </td>
                                <th scope="row"><spring:message code="sal.lbl.invoiceNo" /></span></th> <!-- 영수증 번호 -->
                                <td class="required_area">
                                    <input id="sReceiptNo" name="sReceiptNo" type="text" class="form_input" maxlength="8" >
                                </td>
                                <th scope="row"><spring:message code="sal.lbl.ReceiptPubDt" /></th> <!-- 영수증 발행일자 -->
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
                                <th scope="row"><spring:message code="sal.lbl.uploadDt" /></th> <!-- 업로드 일자 -->
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
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="header_area">
                    <div class="btn_right">
                        <button class="btn_s" id="btnExcel"><spring:message code="global.btn.excelExport" /></button>       <!-- 엑셀 Export -->
                    </div>
                </div>
                <div class="table_grid">
                    <div id="addtaxReceiptMgmtGrid"></div>
                </div>
            </section>
        </div>
        <!-- // 부가세 영수증 관리 -->

        <!-- 부가세 영수증 업로드-->
        <div class="mt0" id="addtaxReceiptUpload">
            <section class="group">
                <div class="header_area">
                    <div class="btn_right">
                        <button type="button" class="btn_s btn_search" id="btnScan" ><spring:message code='global.btn.scan' /><!-- 스캔 --></button>
                        <button type="button" class="btn_s btn_save" id="btnSubmit" ><spring:message code='global.btn.submit' /><!-- 제출 --></button>
                    </div>
                </div>
                <!-- 조회 조건 시작 -->
                <div class="table_form form_width_100per">
                    <table>
                        <caption></caption>
                        <colgroup>
                            <col style="width:8%;">
                            <col style="width:12%;">
                            <col style="width:8%;">
                            <col style="width:12%;">
                            <col style="width:8%;">
                            <col style="width:12%;">
                            <col style="width:8%;">
                            <col style="width:12%;">
                        </colgroup>
                        <tbody>
                            <tr>
                                <th scope="row"><spring:message code="sal.lbl.ReceiptNo" /></span></th> <!-- 영수증 번호 -->
                                <td class="required_area">
                                    <input type="text" id="vReceiptNo" name="vReceiptNo" maxlength="8" class="form_input">
                                </td>
                                <th scope="row"><spring:message code="sal.lbl.ReceiptPubDt" /></th> <!-- 영수증 발행일자 -->
                                <td class="required_area">
                                    <input type="text" id="vReceiptDate" class="form_datepicker ac" />
                                </td>
                                <th scope="row"><spring:message code="sal.lbl.PurchaseCom" /></th> <!-- 구입처 -->
                                <td class="required_area">
                                    <input type="text" id="vPurchaseComp" name="vPurchaseComp" class="form_input" />
                                </td>
                                <th scope="row"></th>
                                <td class="required_area"></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <br>
                <div class="table_info table_info_v2">
                  <table>
                    <caption></caption>
                    <colgroup>
                        <col style="width:25%;">
                        <col style="width:25%;">
                        <col style="width:25%;">
                        <col style="width:25%;">
                    </colgroup>
                    <tbody>
                        <tr>
                            <th scope="row"><span name="tsSecSpan"><spring:message code="sal.lbl.VatReceiptGubn" /></span></th>
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
                <div class="header_area">
                    <div class="btn_right">
                            <button type="button" class="btn_s" id="btnAdd"><spring:message code="global.btn.rowAdd" /></button>
                            <button type="button" class="btn_s" id="btnDel"><spring:message code="global.btn.rowDel" /></button>
                    </div>
                </div>
                <div class="table_grid">
                    <div id="addtaxReceiptUploadGrid"></div>
                </div>
                <br>
                <!-- //조회 조건 시작 -->
                <!-- 영수증 업로드-->
                <div class="table_form form_width_100per">
                    <OBJECT id="objBillOcr" classid="clsid:9920E453-32A0-440A-8E57-38D03B5E7094" width="0" height="0"></OBJECT>
                    <form id="IDScanRecog" name="IDScanRecog">
                    <input type="hidden" id="UserID" name="UserID" value="0000FFAE4653FD7BBDC0">
                    <input type="hidden" id="BillType" name="BillType" value="3">
                    <input type="hidden" id="result" name="result">
                    <input type="hidden" id="scanBlob" name="scanBlob" data-json-obj="true">
                    <table>
                        <caption></caption>
                        <colgroup>
                            <col style="width:10%;">
                            <col style="width:15%;">
                            <col style="width:10%;">
                            <col style="width:15%;">
                            <col style="width:10%;">
                            <col style="width:15%;">
                            <col style="width:10%;">
                            <col style="width:15%;">
                        </colgroup>
                        <tbody>
                            <tr>
                                <th scope="row"><spring:message code='sal.lbl.ReceiptCd' /></th> <!-- 읽어온 영수증 코드 -->
                                <td><!--R19080700284 发票代码必须是10位的数字，否则提示“发票代码应为10位数字，实际为*位(取发票识别结果的位数显示) 贾明 2019-8-6-->
                                    <input type="text" id="scanReceiptCd" name="scanReceiptCd" onkeyup="this.value= this.value.match(/\d+(\.\d{0,2})?/) ? this.value.match(/\d+(\.\d{0,2})?/)[0] :''"  maxlength="10" class="form_input" data-json-obj="true" />
                                </td>
                                <th scope="row"><spring:message code="sal.lbl.PayTaxPinNo" /></th> <!-- 읽어온 납세자 식별 번호 -->
                                <td>
                                    <input type="text" id="scanTaxPayerId" name="scanTaxPayerId" class="form_input" data-json-obj="true" />
                                </td>
                                <th scope="row"><spring:message code="sal.lbl.ReadReceiptNo" /></th> <!-- 읽어온 영수증 번호 -->
                                <td>
                                   <!-- R19080700284 读取的发票号  发票号必须是8位的数字，否则提示“发票号应为8位数字，实际为*位(取发票识别结果的位数显示)； 如果是8个0的数，也不行 贾明  2019-8-7 class="form_input" -->
                                    <input type="text" id="scanReceiptNo" name="scanReceiptNo" maxlength="8" onkeyup="this.value= this.value.match(/\d+(\.\d{0,2})?/) ? this.value.match(/\d+(\.\d{0,2})?/)[0] :''" class="form_numeric ar" data-json-obj="true" />
                                </td>
                                <th scope="row"><spring:message code="sal.lbl.ReadVatIncloudAmt" /></th><!-- 읽어온 세금포함금액 -->
                                <td>
                                    <input type="text" id="scanIncTotAmt" name="scanIncTotAmt" class="form_numeric ar" data-json-obj="true"/>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code='sal.lbl.ReceiptPubDt' /></th> <!-- 영수증 발행일자 -->
                                <td>
                                    <input type="text" id="scanReceiptIssDate" name="scanReceiptIssDate" class="form_datepicker ac" data-json-obj="true" />
                                </td>
                                <th scope="row"><spring:message code="sal.lbl.PurchaseComInfo" /></th> <!-- 구매처 -->
                                <td>
                                    <input type="text" id="scanBuyNm" name="scanBuyNm" class="form_input" data-json-obj="true" />
                                </td>
                                <th scope="row"><spring:message code="sal.lbl.targFilePathNm" /></th> <!-- 저장 경로 -->
                                <td>
                                    <input type="text" id="scanFileImgDir" name="scanFileImgDir" class="form_input form_readonly" data-json-obj="true" readonly />

                                </td>
                                <th scope="row"><spring:message code="global.lbl.FindFile" /></th><!-- 파일 선택 -->
                                <td>
                                    <input type="file" id="scanFile" name="scanFile" class="form_file" />
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="inbox">
                    <div class="con_area">
                        <img id="scanImageView" src="" style="width:10%;height:10%;visibility:hidden;display:block;">
                    </div>
                </div>
            </section>
        </div>
        <!-- 영수증 업로드-->
        
        <!-- TangWei 2021/04/14 绑定车架号 -->
        <div class="mt0" id="bindingVin">
            <section class="group">
                <div class="header_area">
                    <div class="btn_right">
                        <button type="button" class="btn_s btn_search" id="btnSearchBindingVin" ><spring:message code='global.btn.search' /><!-- 查询 --></button>
                        <button type="button" class="btn_s btn_offer" id="btnOffer" ><spring:message code='sal.btn.offer' /><!-- 提报 --></button>
                    </div>
                </div>
                <!-- 조회 조건 시작 -->
                <div class="table_form form_width_100per" role="search" data-btnid="btnSearch">
                    <table>
                        <caption></caption>
                        <colgroup>
                            <col style="width:9%;">
                            <col style="width:12%;">
                            <col style="width:9%;">
                            <col style="width:12%;">
                            <col style="width:9%;">
                            <col style="width:17%;">
                            <col style="width:9%;">
                            <col style="width:17%;">
                        </colgroup>
                        <tbody>
                            <tr>
                                <th scope="row"><spring:message code="global.lbl.vinNo" /></span></th> <!-- VIN -->
                                <td class="required_area">
                                    <input id="sVinNoBinDing" name="sVinNo" type="text" class="form_input" maxlength="17" style="text-transform:uppercase;">
                                </td>
                                <th scope="row"><spring:message code="sal.lbl.invoiceNo" /></span></th> <!-- 영수증 번호 -->
                                <td class="required_area">
                                    <input id="sReceiptNoBinDing" name="sReceiptNo" type="text" class="form_input" maxlength="8" >
                                </td>
                                <th scope="row"><spring:message code="sal.lbl.ReceiptPubDt" /></th> <!-- 영수증 발행일자 -->
                                <td class="required_area">
                                    <div class="form_float">
                                        <div class="date_left">
                                            <input type="text" id="sReceiptStDtBinDing" class="form_datepicker ac" />
                                            <span class="txt_from">~</span>
                                        </div>
                                        <div class="date_right">
                                            <input type="text" id="sReceiptEdDtBinDing" class="form_datepicker ac" />
                                        </div>
                                    </div>
                                </td>
                                <th scope="row"><spring:message code="sal.lbl.statNm" /></th> <!-- 状态-->
                                <td class="required_area">
                                    <input id="showYn" name="showYn" type="text" class="form_comboBox">
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="clfix">
        <div class="left_areaStyle" style="width:49%;">
            <div class="header_area">
                <h2 class="title_basic"><spring:message code='sal.lbl.AddTaxReceipt' /></h2><!-- 增值税发票 -->
            </div>
            <section class="group">
                <!-- 그리드 시작 -->
                <div class="table_grid">
                    <div id="addtaxReceiptBinDingGrid" ></div>
                </div>
                <!-- 그리드 종료 -->
            </section>
        </div>

        <div class="right_areaStyle" style="width:50%;" > 
            <div class="header_area">
                <h2 class="title_basic"><spring:message code='ser.title.carInfo' />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <spring:message code='sal.title.TotalAmountOfSelectedVehicles' />:&nbsp;<input type="text" id="sumCount" value="0" name="sumCount" style="width:20%" disabled="disabled"></input></h2>                     
            </div>
            <!-- 고객정보 끝 -->
            <!-- assign 그리드 시작 -->
            <div class="table_grid">
                <div id="vehicleGrid" ></div>
            </div>
            <!-- assign 그리드 종료 -->
        </div>
    </div>
            </section>
        </div>

    </div>
    <!-- //탭메뉴 전체 영역 -->
</section>

<script type="text/javascript">
var windowHeight = $(window).innerHeight();

/** VIN 조회 팝업 **/
var vinNoSearchPopupWindow;

/** 영수증 이미지 팝업 **/
var receiptImagePopupWindow;

/** 미업로드 원인 **/
var dstbChnCdList = [];
<c:forEach var="obj" items="${dstbChnCdList}">
dstbChnCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}"});
</c:forEach>
var dstbChnCdMap = dms.data.arrayToMap(dstbChnCdList, function(obj){ return obj.cmmCd; });

/* TangWei 2021/04/19 是否显示 */
var showYnList = [];
 <c:forEach var="obj" items="${showYn}">
 showYnList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}"});
 </c:forEach>
 var showYnMap = dms.data.arrayToMap(showYnList, function(obj){ return obj.cmmCd; });

/** 2급망 유형 **/
var secDlrGbList = [];
<c:forEach var="obj" items="${secDlrGbList}">
secDlrGbList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var secDlrGbMap = dms.data.arrayToMap(secDlrGbList, function(obj){ return obj.cmmCd; });

$(document).ready(function() {

    $("#mainTab").kendoExtTabStrip({
        animation:false
        , select:function(e) {
            var selectTabId = e.item.id;
            if (selectTabId === "addtaxReceiptMgmt") {                // 부가세 영수증 관리
                $("#addtaxReceiptMgmtGrid").data("kendoExtGrid").dataSource.page(1);
            } else if (selectTabId === "addtaxReceiptUpload") {       // 부가세 영수증 업로드
                //$("#addtaxReceiptUploadGrid").data("kendoExtGrid").dataSource.page(1);
            } else {
            	$("#addtaxReceiptBinDingGrid").data("kendoExtGrid").dataSource.page(1);
            	$("#vehicleGrid").data("kendoExtGrid").dataSource.page(1);
            	$("#sumCount").val(0);
            };
        }
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
    
    $("#sReceiptStDtBinDing").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='ser.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,value:""
    });

    $("#sReceiptEdDtBinDing").kendoExtMaskedDatePicker({
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

    $("#vReceiptDate").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='ser.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,value:"${sToDt}"
    });

    $("#scanReceiptIssDate").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='ser.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,value:""
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
    
    $("#showYn").kendoExtDropDownList({
    	 dataSource:showYnList
    	 ,dataTextField:"cmmCdNm"
    	 ,dataValueField:"cmmCd"
    	 ,index:0
        /* ,optionLabel:" " */
    });

    $("#scanIncTotAmt").kendoExtNumericTextBox({
        format:"n2"
       ,decimals:2
       ,min: 0.00
       ,value: 0.00
       ,spinners: false
     });

    // 조회
    $("#btnSearch").kendoButton({
        click:function(e) {
            $('#addtaxReceiptMgmtGrid').data('kendoExtGrid').dataSource.page(1);
           }
    });
    
    
    
    // TangWei 2021/04/16 绑定车架号-查询按钮
    $("#btnSearchBindingVin").kendoButton({
    	click:function(e) {
    		var sVinNo = $("#sVinNoBinDing").val();
            var sReceiptNo = $("#sReceiptNoBinDing").val();
            var sReceiptStDt = $("#sReceiptStDtBinDing").data("kendoExtMaskedDatePicker").value();
            var sReceiptEdDt = $("#sReceiptEdDtBinDing").data("kendoExtMaskedDatePicker").value();
            var showYn = $("#showYn").val();
            console.log("sVinNo",sVinNo);
            console.log("sReceiptNo",sReceiptNo);
            console.log("sReceiptStDt",sReceiptStDt);
            console.log("sReceiptEdDt",sReceiptEdDt);
            console.log("showYn",showYn);
            $('#vehicleGrid').data('kendoExtGrid').dataSource.page(1);
            $('#addtaxReceiptBinDingGrid').data('kendoExtGrid').dataSource.page(1);
            
        }
    });
    
    // 绑定车架号-提报按钮
    $("#btnOffer").kendoButton({
        click:function(e) {
        	var dataMap = new Object();
        	// 车辆信息
        	var vehicleGrid = $("#vehicleGrid").data("kendoExtGrid");
        	var vehicleRows = vehicleGrid.select();
        	var dataItem = vehicleGrid.dataSource._data;
            if (vehicleRows.length < 1) {
                dms.notification.info("<spring:message code='global.info.required.select'/>");
                return;
            };
            // 增票信息
            var addtaxReceiptBinDingGrid = $("#addtaxReceiptBinDingGrid").data("kendoExtGrid");
            var addtaxReceipRows = addtaxReceiptBinDingGrid.select();
            if (addtaxReceipRows.length < 1) {
                dms.notification.info("<spring:message code='global.info.required.select'/>");
                return;
            }  
            var selectedVal = addtaxReceiptBinDingGrid.dataItem(addtaxReceiptBinDingGrid.select());
            // 开票金额
            var sumAmt = selectedVal.sumAmt;
            var carPrice = Number(0);
            var flag = true;
            var carIdArray = [];
            var vinNoArray = [];
            vehicleRows.each(function(index, obj) {
                var uid = $(this).attr("data-uid");
                for(var i=0;i<dataItem.length;i++){
                	if (uid == dataItem[i].uid) {
                        if (dataItem[i].retlPrc == null || dataItem[i].retlPrc == '') {
                            dms.notification.info("<spring:message code='sal.info.enterPriceOfTheChecked'/>");
                            flag = false;
                            return false;
                        } else {
                        	// 判断当前输入的车辆价格是否大于指导价的1/2
                        	var retlPrc = dataItem[i].retlPrc;
                        	var msPrc = dataItem[i].msPrc;
                        	if (Number(retlPrc) < (Number(msPrc) / Number(2))) {
                        		dms.notification.info("<spring:message code='sal.info.enterPriceCheck'/>");
                        		flag = false;
                                return false;
                        	}
                        	// 所选车辆的合计金额
                        	carPrice += Number(dataItem[i].retlPrc)
                        	carIdArray[index] = dataItem[i].carId;
                        	vinNoArray[index] = dataItem[i].vinNo;
                        };
                    }
                };
            });
            dataMap["carIdArray"] = carIdArray;
            dataMap["vinNoArray"] = vinNoArray;
            // 判断所选车辆的合计金额是否等于增票的开票金额
            if (flag == true && carPrice != sumAmt) {
            	dms.notification.info("<spring:message code='sal.info.enterTotalPriceCheck'/>");
            	flag = false;
                return false;
            }
            dataMap["receiptNo"] = selectedVal.receiptNo;
            dataMap["receiptId"] = selectedVal.receiptId;
            dataMap["receiptCd"] = selectedVal.receiptCd;
            var param = {
                    "dataMap":dataMap
               };
            /* dms.loading.show(); */
            if (flag) {
            	$.ajax({
                    url:"<c:url value='/sal/rcp/multiAddTaxReceiptAndCarBinDingInfo.do' />",
                    type:'POST',
                    dataType:'json',
                    contentType:'application/json',
                    data:JSON.stringify(dataMap),
                    error:function(jqXHR,status,error){
                        dms.loading.hide();
                        if(jqXHR.responseJSON.errors != null && jqXHR.responseJSON.errors.length > 0){
                            dms.notification.error(jqXHR.responseJSON.errors);
                        }else{
                            dms.notification.error(error);
                        }
                    },
                    success:function(data){
                    	$("#sumCount").val(0);
                        dms.loading.hide();
                        dms.notification.success("<spring:message code='global.info.success'/>");
                        $('#vehicleGrid').data('kendoExtGrid').dataSource.page(1);
                        $('#addtaxReceiptBinDingGrid').data('kendoExtGrid').dataSource.page(1);
                    }
                });
            }
        }
    });
    
    // 增票明细-解绑功能
    $("#unbundling").kendoButton({
        click:function(e) {
            var dataMap = new Object();
            // 选中的待解绑的发票与车辆信息
            var grid = $("#addtaxReceiptMgmtGrid").data("kendoExtGrid");
            var rows = grid.select();
            
            var dataItem = grid.dataSource._data;
            if (rows.length < 1) {
                dms.notification.info("<spring:message code='global.info.required.select'/>");
                return;
            };
            var selectedVal = grid.dataItem(grid.select());
            dataMap["carId"] = selectedVal.carId;
            dataMap["receiptCd"] = selectedVal.receiptCd;
            dataMap["receiptId"] = selectedVal.receiptId;
            dataMap["receiptNo"] = selectedVal.receiptNo;
            dataMap["vinNo"] = selectedVal.vinNo;
            var param = {
                    "dataMap":dataMap
               };
            dms.loading.show();
            $.ajax({
                url:"<c:url value='/sal/rcp/unbundlingAddTaxReceiptAndCar.do' />",
                type:'POST',
                dataType:'json',
                contentType:'application/json',
                data:JSON.stringify(dataMap),
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
                    $("#addtaxReceiptMgmtGrid").data("kendoExtGrid").dataSource.page(1);
                }
            });
        }
    });
    
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

            if(dms.string.isEmpty($("#vReceiptNo").val())){
                dms.notification.info("<spring:message code='sal.lbl.ReceiptNo' var='salLblReceiptNo' /><spring:message code='global.info.emptyCheckParam' arguments='${salLblReceiptNo}' />");
                return;
            }
            if(dms.string.isEmpty($("#scanReceiptNo").val())){
                dms.notification.info("<spring:message code='sal.lbl.ReadReceiptNo' var='salLblReadReceiptNo' /><spring:message code='global.info.emptyCheckParam' arguments='${salLblReadReceiptNo}' />");
                return;
            }
            // R19080700284 读取的发票号  发票号必须是8位的数字，否则提示“发票号应为8位数字，实际为*位(取发票识别结果的位数显示)； 如果是8个0的数，也不行 贾明  2019-8-7 start
            var  scanReceiptVal =  $("#scanReceiptNo").val();
            if(8!=scanReceiptVal.length){
                
                dms.notification.warning("<spring:message code='global.err.eightNumber' arguments='"+scanReceiptVal.length+"'/>");
                return;
            }
            if('00000000' == scanReceiptVal ){
                dms.notification.warning("<spring:message code='global.err.cannotZero'/>");
                return;
            }
            // R19080700284 读取的发票号  发票号必须是8位的数字，否则提示“发票号应为8位数字，实际为*位(取发票识别结果的位数显示)； 如果是8个0的数，也不行 贾明  2019-8-7 start
            if( dms.string.isEmpty($("#scanBlob").val())
                || dms.string.isEmpty($('input[name="scanFileImgDir"]').val())
             ){
                 // 등록된 이미지가 없습니다.
                 dms.notification.warning("<spring:message code='sal.info.noimage' />");
                 return;
             }

            if(dms.string.isEmpty($("#scanReceiptCd").val())){
                dms.notification.info("<spring:message code='sal.lbl.ReceiptCd' var='salLblReceiptCd' /><spring:message code='global.info.emptyCheckParam' arguments='${salLblReceiptCd}' />");
                $("#scanReceiptCd").focus();
                return;
            }
             //R19080700284发票代码必须是10位的数字，否则提示“发票代码应为10位数字，实际为*位(取发票识别结果的位数显示)  贾明 2019-8-7 start
             var scanRcptCdVal =  $("#scanReceiptCd").val();
             if(10!=scanRcptCdVal.length){
               // 
                dms.notification.warning("<spring:message code='global.err.invoiceEgCodeShould' arguments='"+scanRcptCdVal.length+"'/>");
                return;
             }
             /**
             if(scanRcptCdVal.length > 0){
                var scanRFirst = scanRcptCdVal.substr(0,1);
                if('1'!=scanRFirst && '2'!=scanRFirst){
                    dms.notification.warning("<spring:message code='global.err.invoiceNumberCode'/>");
                     return;
                }
             }
             **/
        //R19080700284发票代码必须是12位的数字，否则提示“发票代码应为12位数字，实际为*位(取发票识别结果的位数显示)  发票代码的首个数字是1或2， 贾明 2019-8-7 end

            if(dms.string.isEmpty($("#scanTaxPayerId").val())){
                dms.notification.info("<spring:message code='sal.lbl.PayTaxPinNo' var='salLblPayTaxPinNo' /><spring:message code='global.info.emptyCheckParam' arguments='${salLblPayTaxPinNo}' />");
                $("#scanTaxPayerId").focus();
                return;
            }

            if( dms.string.isEmpty($("#scanIncTotAmt").data("kendoExtNumericTextBox").value())){
                dms.notification.info("<spring:message code='sal.lbl.ReadVatIncloudAmt' var='salLblReadVatIncloudAmt' /><spring:message code='global.info.emptyCheckParam' arguments='${salLblReadVatIncloudAmt}' />");
                $("#scanIncTotAmt").focus();
                return false;
            }

            if( dms.string.isEmpty($("#scanReceiptIssDate").val())){
                dms.notification.info("<spring:message code='sal.lbl.ReceiptPubDt' var='salLblReceiptPubDt' /><spring:message code='global.info.chkSelectItemMsg' arguments='${salLblReceiptPubDt}' />");
                $("#scanReceiptIssDate").focus();
                return false;
            }
            //R19080700284 识别出的日期在当前日期之后，提示“日期有误，请修改 贾明 2019-8-7 start
                if(new Date($("#scanReceiptIssDate").val()).getTime() > new Date().getTime()){
                     dms.notification.warning("<spring:message code='global.err.dateIncorrectPleaseAmend' />");
                     return false;
                }
            //R19080700284 识别出的日期在当前日期之后，提示“日期有误，请修改 贾明 2019-8-7 start

            if(dms.string.isEmpty($("#scanBuyNm").val())){
                dms.notification.info("<spring:message code='sal.lbl.PurchaseComInfo' var='salLblPurchaseComInfo' /><spring:message code='global.info.emptyCheckParam' arguments='${salLblPurchaseComInfo}' />");
                $("#scanBuyNm").focus();
                return;
            }

            // 입력한 영수증 번호 / 스캔한 영수증 번호 비교
            if($("#vReceiptNo").val() != $("#scanReceiptNo").val()){
                return dms.notification.warning("<spring:message code='sal.info.checkScanReceiptNo' />");
            }

            // 입력한 세금포함금액 / 스캔한 세금포함금액 비교
            var grid = $("#addtaxReceiptUploadGrid").data("kendoExtGrid");
            var gridData = grid.dataSource._data;
            var gridTotAmt=0;
            var dataValidate = false;
            $.each(gridData, function(i , rowData){
                gridTotAmt += rowData.sumAmt;
                if(dms.string.isEmpty(rowData.carId)){
                    dataValidate = true;
                    return;
                }
            });
            if(gridTotAmt != $("#scanIncTotAmt").val()){
                return dms.notification.warning("<spring:message code='sal.info.checkScanAmount' />");
            }
            if(dataValidate){
                dms.notification.warning("<spring:message code='ser.info.vinOrCarNoRequired' />");
                return false;
            }

            if( $("#secDlrTp").data('kendoExtDropDownList').dataSource.data().length > 1
              && dms.string.isEmpty($("#secDlrTp").data('kendoExtDropDownList').value()) ){
                dms.notification.warning("<spring:message code='sal.lbl.CarReceiptGubn' var='salLblCarReceiptGubn' /><spring:message code='global.info.emptyCheckParam' arguments='${salLblCarReceiptGubn}' />");
                return;
            }

            var formSaveData = $("#IDScanRecog").serializeObject($("#IDScanRecog").serializeArrayInSelector("[data-json-obj='true']"));
            formSaveData.secDlrCd = $("#secDlrCd").val();
            formSaveData.sdlrTp = $("#secDlrTp").data("kendoExtDropDownList").value();
            formSaveData.sdlrNm = $("#secDlrNm").val();

            var grid = $("#addtaxReceiptUploadGrid").data("kendoExtGrid");
            var gridSaveData = grid.getCUDData("insertList", "updateList", "deleteList");

            var params = $.extend(
                    {"salesAddTaxRcitVO":formSaveData}
                   ,{"addTaxRcitList":gridSaveData}
             );

            dms.loading.show();

            $.ajax({
                url:"<c:url value='/sal/rcp/insertSalesAddTaxReceiptSave.do' />",
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
                success:function(data){
                    dms.loading.hide();

                    // 저장이 완료되었습니다.
                    dms.notification.success("<spring:message code='global.lbl.save' var='globalLblSave' /><spring:message code='global.info.successMsg' arguments='${globalLblSave}' />");
                    $("#vReceiptNo").val("");
                    $("#scanFile").val("");
                    ClearInfo();
                }
            });
       }
    });

    // 추가
    $("#btnAdd").kendoButton({
        click:function(e) {
            $('#addtaxReceiptUploadGrid').data('kendoExtGrid').dataSource.insert({
                "vinNo":""
               ,"sumAmt":0
               ,"taxAmt":0
             });
        }
    });

    // 삭제
    $("#btnDel").kendoButton({
        click:function(e) {
            var grid = $("#addtaxReceiptUploadGrid").data("kendoExtGrid");
            var rows = grid.select();

            if (rows.length < 1) {
                //목록을 선택하여 주십시오.
                dms.notification.info("<spring:message code='global.info.required.select'/>");
                return;
            }

            rows.each(function(index, row) {
                grid.removeRow(row);
            });
        }
    });
    
    // 删除一行
    deleteRow = function () {
    	console.log("删除一行");
    	var grid = $("#addtaxReceiptBinDingGrid").data("kendoExtGrid");
        var rows = grid.select();

        if (rows.length < 1) {
            //목록을 선택하여 주십시오.
            dms.notification.info("<spring:message code='global.info.required.select'/>");
            return;
        }

        rows.each(function(index, row) {
            grid.removeRow(row);
        });
    }

    // 更改数据库的是否显示的字段
    updateShowYnStatis = function (e) {
    	console.log("更改是否显示状态");
    	var grid = $("#addtaxReceiptBinDingGrid").data("kendoExtGrid");
        var rows = grid.select();
        var selectedVal = grid.dataItem(grid.select());
        
        var dataMap = new Object();
        dataMap["receiptId"] = selectedVal.receiptId;
        dataMap["receiptNo"] = selectedVal.receiptNo;
        dataMap["showYn"] = selectedVal.showYn;
        var param = {
                "dataMap":dataMap
           };

        dms.loading.show();

        $.ajax({
            url:"<c:url value='/sal/rcp/updateAddTaxReceiptShowYn.do' />",
            type:'POST',
            dataType:'json',
            contentType:'application/json',
            data:JSON.stringify(dataMap),
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
                $("#addtaxReceiptBinDingGrid").data("kendoExtGrid").dataSource.page(1);
            }
        });
        
    }
    
    // 차량 정보 조회
    vinSearch = function(){
        var grid = $("#addtaxReceiptUploadGrid").data("kendoExtGrid");
        var gridData = grid.dataItem(grid.select());

        var vinNo = dms.string.strNvl(gridData.vinNo);

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
                    , "sVinNo":vinNo
                    , "callbackFunc":function(data){
                        if(data.length >= 1) {
                            gridData.set("vinNo", data[0].vinNo);
                            gridData.set("carId", data[0].carId);
                            gridData.set("carlineCd", data[0].carlineCd);
                            gridData.set("carlineNm", data[0].carlineNm);
                            gridData.set("modelCd", data[0].modelCd);
                            gridData.set("modelNm", data[0].modelNm);
                            gridData.set("jeongpanNo", data[0].vinmF20010);
                            gridData.set("wsPrc", data[0].wsPrc);
                            gridData.set("extColorCd", data[0].extColorCd);
                            gridData.set("extColorNm", data[0].extColorNm);
                            gridData.set("dlrCd", data[0].dlrCd);
                            gridData.set("pltGiDt", data[0].pltGiDt);
                            gridData.set("custSaleDt", data[0].custSaleDt);
                        }
                        vinNoSearchPopupWindow.close();
                    }
                }
            }
        });


    };

    //버튼 - 엑셀다운로드
    $("#btnExcel").kendoButton({
        click:function(e) {

            dms.ajax.excelExport({
                "beanName":"salesAddTaxRcitService"
                ,"templateFile":"SalesAddTaxRcit.xlsx"
                //,"fileName":"SalesAddTaxRcit.xlsx"
                //CSR 171  下载文件英文名 更改成中文 增值税发票管理 2021-1-22 sart
                 ,"fileName": "<spring:message code='sal.title.AddTaxReceipt' />.xlsx"
                //CSR 171  下载文件英文名 更改成中文 增值税发票管理      2021-1-22 end
                ,"sVinNo":$("#sVinNo").val()
                ,"sReceiptNo":$("#sReceiptNo").val()
                ,"sReceiptStDt":kendo.toString($("#sReceiptStDt").data("kendoExtMaskedDatePicker").value(), "yyyyMMdd")
                ,"sReceiptEdDt":kendo.toString($("#sReceiptEdDt").data("kendoExtMaskedDatePicker").value(), "yyyyMMdd")
                ,"sUploadStDt":kendo.toString($("#sUploadStDt").data("kendoExtMaskedDatePicker").value(), "yyyyMMdd")
                ,"sUploadEdDt":kendo.toString($("#sUploadEdDt").data("kendoExtMaskedDatePicker").value(), "yyyyMMdd")
                ,"sDlrCd":$("#sDlrCd").val()
            });

        }
    });

    // 영수증 관리 그리드 시작
    $("#addtaxReceiptMgmtGrid").kendoExtGrid({
        gridId:"G-SAL-2017-121531"
        ,dataSource:{
             transport:{
                read:{
                    url:"<c:url value='/sal/rcp/selectSalesAddTaxReceiptSearch.do' />"
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
                        params["sReceiptStDt"] = $("#sReceiptStDt").data("kendoExtMaskedDatePicker").value();
                        params["sReceiptEdDt"] = $("#sReceiptEdDt").data("kendoExtMaskedDatePicker").value();
                        params["sUploadStDt"] = $("#sUploadStDt").data("kendoExtMaskedDatePicker").value();
                        params["sUploadEdDt"] = $("#sUploadEdDt").data("kendoExtMaskedDatePicker").value();

                        return kendo.stringify(params);

                    } else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    };
                }
            }
            ,schema:{
                model:{
                    id:"vinNo"
                    ,fields:{
                        vinNo:{type:"string", editable:false }
                        ,seq:{type:"number", editable:false }
                        ,receiptNo:{type:"string", editable:false }
                        ,receiptIssDt:{type:"date", editable:false}
                        ,uploadDt:{type:"date", editable:false }
                        ,buyNm:{type:"string", editable:false }
                        ,taxpayerIdCd:{type:"string", editable:false }
                        ,sdlrCd:{type:"string", editable:false }
                        ,sdlrTp:{type:"string", editable:false }
                        ,sdlrNm:{type:"string", editable:false }
                        ,sumAmt:{type:"number", editable:false }
                        ,taxAmt:{type:"number", editable:false }
                        ,carlineNm:{type:"string", editable:false }
                        ,modelNm:{type:"string", editable:false }
                        ,wsPrc:{type:"number", editable:false}
                        ,extColorNm:{type:"string", editable:false}
                        ,dlrCd:{type:"string", editable:false}
                        ,custSaleDt:{type:"date", editable:false}
                        ,pltGiDt:{type:"date", editable:false}
                        ,receiptImg:{type:"string", editable:false}
                    }
                }

                ,parse:function(d) {
                    if(d.data){
                        $.each(d.data, function(idx, elem) {
                            elem.rnum = d.total - elem.rnum + 1;
                            elem.receiptIssDt = kendo.parseDate(elem.receiptIssDt, "<dms:configValue code='dateFormat' />");
                            elem.uploadDt = kendo.parseDate(elem.uploadDt, "<dms:configValue code='dateFormat' />");

                        });
                    }
                    return d;
                }
            }
        }
        ,height:windowHeight-200
        ,navigatable:false
        ,selectable:"row"
        ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
        ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
        ,multiSelectWithCheckbox:false     //멀티선택 적용. default:false
        ,appendEmptyColumn:false           //빈컬럼 적용. default:false
        ,sortable:true
        ,enableTooltip:true               //Tooltip 적용, default:false
        ,columns:[
             {field:"receiptNo", title:"<spring:message code='sal.lbl.rcptNo' />", width:80 ,attributes:{"class":"ac"} }                /* 영수증번호 */
            ,{field:"receiptIssDt", title:"<spring:message code='sal.lbl.ReceiptPubDt' />", width:100
                ,attributes:{"class":"ac"}
                ,format: "{0:<dms:configValue code='dateFormat' />}"
             }      /* 영수증발행일자 */
            ,{field:"uploadDt", title:"<spring:message code='sal.lbl.uploadDt' />", width:100
                ,attributes:{"class":"ac"}
                ,format: "{0:<dms:configValue code='dateFormat' />}"
             }      /* 업로드일자 */
            ,{field:"buyNm", title:"<spring:message code='sal.lbl.PurchaseCom' />", width:200, sortable:false }              /* 구입처 */
            ,{field:"taxpayerIdCd", title:"<spring:message code='sal.lbl.PayTaxPinNo' />", width:130, sortable:false }       /* 납세자식별번호 */
            ,{field:"sdlrCd", title:"<spring:message code='sal.lbl.lv2CdVat' />", width:100 ,attributes:{"class":"ac"}, sortable:false}           /* 2급망표시(증표) */
            ,{field:"vinNo", title:"<spring:message code='sal.lbl.carVinNo' />", width:150, sortable:false}                  /* VIN */
            ,{field:"sumAmt", title:"<spring:message code='sal.lbl.PublishAmt' />", width:100, attributes :{"class":"ar"}, format:"{0:n2}", sortable:false}               /* 발행금액 */
            ,{field:"taxAmt", title:"<spring:message code='sal.lbl.vatAmt' />", width:100, attributes :{"class":"ar"}, format:"{0:n2}", sortable:false}                   /* 발행세액 */
            ,{field:"carlineNm", title:"<spring:message code='ser.lbl.carLine' />", width:80, sortable:false}               /* 차종 */
            ,{field:"modelNm", title:"<spring:message code='global.lbl.model' />", width:200, sortable:false}                /* 모델 */
            ,{field:"wsPrc", title:"<spring:message code='sal.lbl.guideAmt' />", width:100, attributes :{"class":"ar"}, format:"{0:n2}", sortable:false}                  /* 지도가격 */
            ,{field:"extColorNm", title:"<spring:message code='sal.lbl.extColor' />", width:100, sortable:false}             /* 외색 */
            ,{field:"dlrCd", title:"<spring:message code='global.lbl.dlrCd' />", width:80 ,attributes:{"class":"ac"}, sortable:false}                  /* 딜러코드 */
            ,{field:"custSaleDt", title:"<spring:message code='sal.lbl.saleDt' />", width:100
                ,attributes:{"class":"ac"}
                ,format: "{0:<dms:configValue code='dateFormat' />}"
             }    /* 출고일자 */
            ,{field:"pltGiDt", title:"<spring:message code='sal.lbl.pltGiDt' />", width:100, hidden:true
                ,attributes:{"class":"ac"}
                ,format: "{0:<dms:configValue code='dateFormat' />}"
             }    /* 공장출고일자 */

            ,{field:"sdlrTp", title:"<spring:message code='sal.lbl.Slv2DlrType' />", width:70, attributes:{"class":"ac"}, sortable:false
                ,template:function(dataItem){
                    if(dataItem.sdlrTp != "EW" && dataItem.sdlrTp != "WX"){
                        return "";
                    }else{
                        return secDlrGbMap[dataItem.sdlrTp].cmmCdNm;
                    }
                }
             }                   /* 2급망 유형 */
            ,{field:"sdlrNm", title:"<spring:message code='sal.lbl.SgradeNwIden' />", width:70, attributes:{"class":"ac"}, sortable:false
                ,template:function(dataItem){
                    if(dataItem.sdlrTp != "EW" && dataItem.sdlrTp != "WX"){
                        return "";
                    }else{
                        return dataItem.sdlrNm;
                    }
                }
             }                   /* 2급망 명칭 */
            ,{field:"receiptImg", title:"<spring:message code='sal.lbl.RcptImage' />", width:100, sortable:false
                ,attributes:{"class":"ac"}
                ,template:function(dataItem){
                    if(!dms.string.isEmpty(dataItem.receiptNo)){
                        return "<a href='#' class='btnImage'><span class='txt_label bg_yellow'><spring:message code='global.btn.search' /></span></a>";
                    }
                    return "";
                 }
             }            /* 영수증이미지 */
        ]
    });
    // 영수증 관리 그리드 종료

    /* TangWei 2021/04/14 增值税发票列表 Start */
    $("#addtaxReceiptBinDingGrid").kendoExtGrid({
    	gridId:"G-SAL-2017-121531"
        ,dataSource:{
             transport:{
                read:{
                    url:"<c:url value='/sal/rcp/selectAddTaxReceiptList.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};

                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        params["sVinNo"] = $("#sVinNoBinDing").val();
                        params["sReceiptNo"] = $("#sReceiptNoBinDing").val();
                        params["sReceiptStDt"] = $("#sReceiptStDtBinDing").data("kendoExtMaskedDatePicker").value();
                        params["sReceiptEdDt"] = $("#sReceiptEdDtBinDing").data("kendoExtMaskedDatePicker").value();
                        params["showYn"] = $("#showYn").val();

                        return kendo.stringify(params);

                    } else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    };
                }
            }
            ,schema:{
                model:{
                    id:"vinNo"
                    ,fields:{
                        vinNo:{type:"string", editable:false }
                        ,seq:{type:"number", editable:false }
                        ,receiptNo:{type:"string", editable:false }
                        ,receiptIssDt:{type:"date", editable:false}
                        ,uploadDt:{type:"date", editable:false }
                        ,buyNm:{type:"string", editable:false }
                        ,taxpayerIdCd:{type:"string", editable:false }
                        ,sdlrCd:{type:"string", editable:false }
                        ,sdlrTp:{type:"string", editable:false }
                        ,sdlrNm:{type:"string", editable:false }
                        ,sumAmt:{type:"number", editable:false }
                        ,taxAmt:{type:"number", editable:false }
                        ,carlineNm:{type:"string", editable:false }
                        ,modelNm:{type:"string", editable:false }
                        ,wsPrc:{type:"number", editable:false}
                        ,extColorNm:{type:"string", editable:false}
                        ,dlrCd:{type:"string", editable:false}
                        ,custSaleDt:{type:"date", editable:false}
                        ,pltGiDt:{type:"date", editable:false}
                        ,receiptImg:{type:"string", editable:false}
                    }
                }

                ,parse:function(d) {
                    if(d.data){
                        $.each(d.data, function(idx, elem) {
                            elem.rnum = d.total - elem.rnum + 1;
                            elem.receiptIssDt = kendo.parseDate(elem.receiptIssDt, "<dms:configValue code='dateFormat' />");
                            elem.uploadDt = kendo.parseDate(elem.uploadDt, "<dms:configValue code='dateFormat' />");

                        });
                    }
                    return d;
                }
            }
        }
        ,height:windowHeight-200
        ,navigatable:true
        ,selecteable:"multiple,rowbox"
        ,indvColumnVisible:false           //컬럼 보이기/감추기 개인화 적용. default:true
        ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
        ,multiSelectWithCheckbox:false     //멀티선택 적용. default:false
        ,appendEmptyColumn:false           //빈컬럼 적용. default:false
        ,sortable:true
        ,enableTooltip:true               //Tooltip 적용, default:false
        ,editable:true
        ,edit:function(e){
            /* var grid = $("#receiptScanGrid").data("kendoExtGrid");
            var selectedVal = grid.dataItem(grid.select());
            if(!dms.string.isEmpty(selectedVal.appReceiptId)){
                this.closeCell();
            } */
        }
        ,columns:[
        	 {field:"buyNm", title:"购方名称", width:80 ,attributes:{"class":"ac"}, sortable:false }     /* 购方名称 */
        	 ,{field:"receiptIssDt", title:"<spring:message code='sal.lbl.ReceiptPubDt' />", width:100   /* 开票日期 */
                 ,attributes:{"class":"ac"}
                 ,format: "{0:<dms:configValue code='dateFormat' />}"
              }  
        	 ,{field:"receiptNo", title:"<spring:message code='sal.lbl.rcptNo' />", width:80 ,attributes:{"class":"ac"}, sortable:false }     /* 发票号码 */
            ,{field:"sumAmt", title:"<spring:message code='sal.lbl.PublishAmt' />", width:100, attributes :{"class":"ar"}, format:"{0:n2}", sortable:true} /* 开票金额 */   
            ,{field:"taxAmt", title:"<spring:message code='sal.lbl.vatAmt' />", width:100, attributes :{"class":"ar"}, format:"{0:n2}", sortable:true} /* 开票税额 */    
            ,{field:"showYn", title:"<spring:message code='sal.lbl.statNm' />", width:70, sortable:false,editor:function(container, options) {
                $('<input name="showYn" data-bind="value:' + options.field + '"/>')
                .appendTo(container)
                .kendoExtDropDownList({
                    valuePrimitive:true
                    ,dataSource:showYnList
                    ,dataTextField:"cmmCdNm"
                    ,dataValueField:"cmmCd"
                    /* ,optionLabel:" " */
	                ,close: function(e) {  
	                	// 关闭下拉菜单时触发
	                    console.log(e);
	                    console.log("showYnMap",$("#showYn").val()); // 改变前的值
	                    console.log("end",e.sender._old);  // 改变后的值
	                	if ($("#showYn").val() != e.sender._old) {
	                		// 如果当前框的值发生了改变，调用方法去掉该行，并更新数据库的状态
	                		updateShowYnStatis(e.sender._old);
	                	}
	                }
                })
                $('<span class="k-invalid-msg" data-for="showYn"></span>').appendTo(container);	
            },template:"# if(showYnMap[showYn] != null) { # #= showYnMap[showYn].cmmCdNm# # }#"}   
        ]
    });
    /* TangWei 2021/04/14 增值税发票列表 End */
    
    var sumCountList = [];
    var gridList = [];
    var isCheckbox = true;
    // 行单击方法
	$("#vehicleGrid").on("click", "tr.k-state-selected", function (e) {
		var vehicleGrid = $("#vehicleGrid").data("kendoExtGrid");
		if (isCheckbox) {
			vehicleGrid.clearSelection();
	        sumCountList = [];
	        gridList = [];
	        $("#sumCount").val(0);
		} else {
		    var selectedVal = vehicleGrid.dataItem(vehicleGrid.select());
		    var uid = $(this).attr("data-uid");
		    gridCheckBoxSet(uid,false);
		    $(vehicleGrid.tbody.find("tr[data-uid=" + uid + "]")).removeClass("k-state-selected");
		    var sumCount = Number(0);
		    for(var i=0;i<sumCountList.length;i++){
		    	sumCount = sumCount + Number(sumCountList[i]);
	        };
	        var ischecked = $("input[type='checkbox']").is(':checked');
	        $("#sumCount").val(sumCount);
	        isCheckbox = true;
		}
		
	    /* vehicleGrid.clearSelection();
        sumCountList = [];
        gridList = [];
        $("#sumCount").val(0); */
       
        
	});
    
	
    // 复选框单选中事件
    $("#vehicleGrid").on("click",".grid-checkbox-item", function(e){
    	var flag = true;
    	var sumCount = Number(0);
    	var checked = $(this).is(":checked");
    	var grid = $("#vehicleGrid").data("kendoExtGrid");
    	var chkBoolean = true;
    	var uid = $(this).attr("data-uid");
    	var rows = grid.tbody.find("tr");
    	rows.each(function(index, obj) {
    		var dataItem = grid.dataSource._data;
    		if (uid == dataItem[index].uid) {
    			$(grid.tbody.find("tr[data-uid=" + dataItem[index].uid + "]")).toggleClass("k-state-selected");
    			if (dataItem[index].retlPrc != null && dataItem[index].retlPrc != '') {
    				if (gridList != null && gridList.length > 0) {
    					var isAdd = true;
    					for(var i=0;i<gridList.length;i++){
        			    	if (gridList[i] == dataItem[index].carId) {
        			    		// 集合中已经选中这条数据，删除掉
        			    		gridList.splice(i,1);
        			    		sumCountList.splice(i,1);
        			    		isAdd = false;
        			    		isCheckbox = false;
        			    		break;
        			    	} 
        		        };
        		        if (isAdd) {
        		        	sumCountList.push(dataItem[index].retlPrc);
    	    				gridList.push(dataItem[index].carId);
        		        }
    				} else {
    					sumCountList.push(dataItem[index].retlPrc);
	    				gridList.push(dataItem[index].carId);
    				}
    			} else {
    				// 提示维护车辆单价
    				dms.notification.info("请输入勾选车辆的单价");
    				$(grid.tbody.find("tr[data-uid=" + dataItem[index].uid + "]")).removeClass("k-state-selected");
    				gridCheckBoxSet($(this).attr("data-uid"), false);
                    flag = false;
                    return false;
    			}
    		} 
    	});
    	if (flag) {
    		for(var i=0;i<sumCountList.length;i++){
                sumCount += Number(sumCountList[i]);
                $("#sumCount").val(sumCount);
            };
            gridCheckBoxSet($(this).attr("data-uid"), checked);
    	}
    	
    })
    
    // 复选框全选中事件
    $("#vehicleGrid").on("click",".checkAll", function(e){
    	var flag = true;
    	sumCountList = [];
    	gridList = [];
        var sumCount = Number(0);
        var checked = $(this).is(":checked");
        var grid = $("#vehicleGrid").data("kendoExtGrid");
        var chkBoolean = true;
        var uid = $(this).attr("data-uid");
        var rows = grid.tbody.find("tr");
        if (sumCountList == null || sumCountList.length == 0) {
	        rows.each(function(index, obj) {
	        	var isSelected = rows[index].ariaSelected;
	            var dataItem = grid._data;
	            if ("true"== isSelected) {
	            	if (dataItem[index].retlPrc != null && dataItem[index].retlPrc != '') {
	                    sumCountList.push(dataItem[index].retlPrc);
	                    gridList.push(dataItem[index].carId);
	                    sumCount += Number(dataItem[index].retlPrc);
	                } else {
	                    // 提示维护车辆单价
	                    dms.notification.info("请输入勾选车辆的单价");
	                    sumCountList = [];
	                    gridList = [];
	                    grid.clearSelection();
	                    gridCheckBoxSet($(this).attr("data-uid"), false);
	                    flag = false;
	                    return false;
	                };
	            }
	        });
	        if (flag) {
	        	$("#sumCount").val(sumCount);
	        } else {
	        	$("#sumCount").val(0);
	        }
        } 
        if (flag) {
        	gridCheckBoxSet($(this).attr("data-uid"), checked);
        }
    })
    
    // 复选框样式更改
    gridCheckBoxSet = function(uid, checked) {
    	var grid = $("#vehicleGrid").data("kendoExtGrid");
    	var selectedVal = grid.dataItem(grid.select());
    	var rows = grid.tbody.find("tr[data-uid=" + uid + "]");
    	if (checked) {
    		$(".grid-checkbox-item[data-uid=" + uid + "]").prop("checked", true);
    		$(".grid-checkbox-item[data-uid=" + uid + "]").addClass("k-state-selected");
    	} else {
    		$(".grid-checkbox-item[data-uid=" + uid + "]").prop("checked", false);
            $(".grid-checkbox-item[data-uid=" + uid + "]").removeClass("k-state-selected");
    	}
    }

    /* TangWei 2021/04/14 车辆信息列表 Start */
    $("#vehicleGrid").kendoExtGrid({
        gridId:"G-SAL-2017-121531"
        ,dataSource:{
             transport:{
                read:{
                    url:"<c:url value='/sal/veh/vehicleMaster/sal/veh/selectBindingVinNoCarInfo.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};

                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        params["sVinNo"] = $("#sVinNoBinDing").val();
                        return kendo.stringify(params);

                    } else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    };
                }
            }
            ,schema:{
                model:{
                    id:"vinNo"
                    ,fields:{
                        vinNo:{type:"string", editable:false }
                        ,seq:{type:"number", editable:false }
                        ,receiptNo:{type:"string", editable:false }
                        ,receiptIssDt:{type:"date", editable:false}
                        ,uploadDt:{type:"date", editable:false }
                        ,buyNm:{type:"string", editable:false }
                        ,taxpayerIdCd:{type:"string", editable:false }
                        ,sdlrCd:{type:"string", editable:false }
                        ,sdlrTp:{type:"string", editable:false }
                        ,sdlrNm:{type:"string", editable:false }
                        ,sumAmt:{type:"number", editable:false }
                        ,taxAmt:{type:"number", editable:false }
                        ,carlineNm:{type:"string", editable:false }
                        ,modelNm:{type:"string", editable:false }
                        ,wsPrc:{type:"number", editable:false}
                        ,extColorNm:{type:"string", editable:false}
                        ,dlrCd:{type:"string", editable:false}
                        ,custSaleDt:{type:"date", editable:false}
                        ,pltGiDt:{type:"date", editable:false}
                        ,receiptImg:{type:"string", editable:false}
                    }
                }

                ,parse:function(d) {
                    if(d.data){
                        $.each(d.data, function(idx, elem) {
                            elem.rnum = d.total - elem.rnum + 1;
                            elem.receiptIssDt = kendo.parseDate(elem.receiptIssDt, "<dms:configValue code='dateFormat' />");
                            elem.uploadDt = kendo.parseDate(elem.uploadDt, "<dms:configValue code='dateFormat' />");

                        });
                    }
                    return d;
                }
            }
        }
        ,height:windowHeight-200
        ,navigatable:false
        /* ,selectable:"row" */
        ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
        ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
        ,multiSelectWithCheckbox:true     //멀티선택 적용. default:false
        ,appendEmptyColumn:false           //빈컬럼 적용. default:false
        ,sortable:true
        ,enableTooltip:true 
        ,selecteable:"multiple,rowbox"
        /* ,change:function(e){
            var vehicleGrid = $("#vehicleGrid").data("kendoExtGrid");
            var selectedVal = vehicleGrid.dataItem(vehicleGrid.select());
            if (dms.string.isEmpty(selectedVal.retlPrc)) {
                vehicleGrid.clearSelection();
               gridCheckBoxSet(vehicleGrid,false);
            }
        } */
        ,editable:true
        ,edit:function(e){
            /* var vehicleGrid = $("#vehicleGrid").data("kendoExtGrid");
            var selectedVal = vehicleGrid.dataItem(vehicleGrid.select());
            if(!dms.string.isEmpty(selectedVal.appReceiptId)){
                this.closeCell();
            } */
        }
        ,columns:[
        	{field:"vinNo", title:"<spring:message code='sal.lbl.vinNo' />", width:80 ,attributes:{"class":"ac"} }     /* 车辆识别码 */
            ,{field:"carlineNm", title:"<spring:message code='global.lbl.carLine' />", width:100 ,attributes:{"class":"ac"}}   /* 车种 */
            ,{field:"modelNm", title:"<spring:message code='global.lbl.model' />", width:80 ,attributes:{"class":"ac"} }     /* 车款 */
           ,{field:"retlPrc", title:"<spring:message code='sal.lbl.price' />", width:100, attributes :{"class":"ar"}, format:"{0:n2}", sortable:false} /* 价格 */
           ,{field:"extColorNm", title:"<spring:message code='sal.lbl.extColor' />", width:100, attributes :{"class":"ar"}} /* 外色 */    
           ,{field:"ordTp", title:"<spring:message code='sal.lbl.ordCd' />", width:100, sortable:false
               /* ,attributes:{"class":"ac"}
               ,template:function(dataItem){
                   if(!dms.string.isEmpty(dataItem.receiptNo)){
                       return "<a href='#' class='btnImage'><span class='txt_label bg_yellow'><spring:message code='global.btn.search' /></span></a>";
                   }
                   return "";
                } */
            }          /* 订单类型 */
           ,{field:"msPrc", title:"<spring:message code='sal.lbl.carRetlAmt' />", width:100, attributes :{"class":"ar"}, format:"{0:n2}", sortable:false} /* 指导价 */
        ]
    });
    /* TangWei 2021/04/14 车辆信息列表 End */
    
    // 영수증 업로드 그리드 시작
    $("#addtaxReceiptUploadGrid").kendoExtGrid({
        dataSource:{
             transport:{
                 read :{
                     url:null
                 }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {
                        // 검색 조건을 파라미터로 담는다.
                        var params = {};
                        /* params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        //params["sort"] = options.sort;

                        params["sVinNo"] = $("#sVinNo").val();
                        params["sReceiptNo"] = $("#sReceiptNo").val();
                        params["sReceiptStDt"] = $("#sReceiptStDt").data("kendoExtMaskedDatePicker").value();
                        params["sReceiptEdDt"] = $("#sReceiptEdDt").data("kendoExtMaskedDatePicker").value();
                        params["sUploadStDt"] = $("#sUploadStDt").data("kendoExtMaskedDatePicker").value();
                        params["sUploadEdDt"] = $("#sUploadEdDt").data("kendoExtMaskedDatePicker").value(); */

                        return kendo.stringify(params);
                    } else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    };
                }
            }
            ,schema:{
                model:{
                    id:"vinNo"
                    ,fields:{
                        vinNo:{type:"string"}
                       ,carId:{type:"string"}
                       ,carlineCd:{type:"string"}
                       ,carlineNm:{type:"string"}
                       ,modelCd:{type:"string"}
                       ,modelNm:{type:"string"}
                       ,jeongpanNo:{type:"string"}
                       ,wsPrc:{type:"number"}
                       ,extColorCd:{type:"string"}
                       ,extColorNm:{type:"string"}
                       ,dlrCd:{type:"string"}
                       ,custSaleDt:{type:"date"}
                       ,pltGiDt:{type:"date"}
                       ,sumAmt:{type:"number"}
                       ,taxAmt:{type:"number"}
                    }
                }
            }
        }
        ,height:292
        ,navigatable:true
        ,pageable:false
        ,selectable:"row"
        ,autoBind:false
        ,sortable:false
        ,indvColumnVisible:false          //컬럼 보이기/감추기 개인화 적용. default:true
        ,indvColumnReorderable:false      //컬럼순서 변경 개인화 적용. default:true
        ,multiSelectWithCheckbox:true     //멀티선택 적용. default:false
        ,multiSelectLocked:false          //멀티선택 컬럼 틀고정 default:false
        ,appendEmptyColumn:false          //빈컬럼 적용. default:false
        ,enableTooltip:false               //Tooltip 적용, default:false
        ,edit:function(e){
            // set maxLengths
            e.container.find("input[name=vinNo]").attr("maxlength", 17);

            var eles = e.container.find("input")
              , rows = e.sender.select()
              , selectedItem = e.sender.dataItem(rows[0])
              , fieldName;
            if(eles.length > 1){
                fieldName = eles[eles.length-1].getAttribute("name");
            }else{
                fieldName = eles.attr("name");
            }
            var input = e.container.find(".k-input");

            if(fieldName == "carId"
              || fieldName == "carlineCd"
              || fieldName == "carlineNm"
              || fieldName == "modelCd"
              || fieldName == "modelNm"
              || fieldName == "jeongpanNo"
              || fieldName == "wsPrc"
              || fieldName == "extColorCd"
              || fieldName == "extColorNm"
              || fieldName == "dlrCd"
              || fieldName == "custSaleDt"
              || fieldName == "pltGiDt"
            ){
                this.closeCell();
            }

        }
        ,columns:[
             {field:"vinNo", title:"<spring:message code='sal.lbl.carVinNo' />", width:200
                 ,attributes:{"class":"al"}
                 ,editor:function(container, options) {
                     $('<div class="form_search"><input required type="text" id="vinNo" name="vinNo" data-name="<spring:message code='sal.lbl.carVinNo'/>" class="form_input" style="text-transform:uppercase;width:100%" /><a href="#" onclick="vinSearch()" >&nbsp;</a></div>')
                     .appendTo(container);
                     $('<span class="k-invalid-msg" data-for="vinNo"></span>')
                     .appendTo(container);
                  }
             }            /* VIN */
            //,{field:"carId", title:"<spring:message code='sal.lbl.carId' />", width:0 }          /* Car Id */
            //,{field:"carlineCd", title:"<spring:message code='global.lbl.carlineCd' />", width:0 }      /* 차종 */
            ,{field:"carlineNm", title:"<spring:message code='global.lbl.carlineNm' />", width:100 }      /* 차종 */
            //,{field:"modelCd", title:"<spring:message code='global.lbl.model' />", width:0 }          /* 차관 */
            ,{field:"modelNm", title:"<spring:message code='global.lbl.modelNm' />", width:150 }          /* 차관 */
            ,{field:"jeongpanNo", title:"<spring:message code='sal.lbl.Decline' />", width:100 }         /* 창패사양 */
            ,{field:"wsPrc", title:"<spring:message code='sal.lbl.guideAmt' />", width:100, attributes :{"class":"ar"}, format:"{0:n2}"}         /* 지도가격 */
            //,{field:"extColorCd", title:"<spring:message code='sal.lbl.extColor' />", width:0}        /* 외색 */
            ,{field:"extColorNm", title:"<spring:message code='global.lbl.extColorNm' />", width:100}        /* 외색 */
            ,{field:"dlrCd", title:"<spring:message code='sar.lbl.dlrCd' />", width:100}                /* 딜러코드 */
            ,{field:"custSaleDt", title:"<spring:message code='sal.lbl.saleDt' />", width:100
                ,attributes:{"class":"ac"}
                ,format: "{0:<dms:configValue code='dateFormat' />}"
            }            /* 출고일자 */
            ,{field:"pltGiDt", title:"<spring:message code='sal.lbl.pltGiDt' />", width:100, hidden:true
                ,attributes:{"class":"ac"}
                ,format: "{0:<dms:configValue code='dateFormat' />}"
            }            /* 공장출고일자 */
            ,{field:"sumAmt", title:"<spring:message code='sal.lbl.PublishAmt' />", width:100, attributes :{"class":"ar"}, format:"{0:n2}"}      /* 금액 */
            ,{field:"taxAmt", title:"<spring:message code='sal.lbl.vatAmt' />", width:100, attributes :{"class":"ar"}, format:"{0:n2}"}              /* 세액 */
        ]
    });
    // 영수증 업로드 그리드 종료

    $("#addtaxReceiptUploadGrid").data("kendoExtGrid").table.on("keydown", function(e){
        if(e.which == 13){
            vinSearch();
        }
    });

    // 영수증 이미지 팝업
    $(document).on("click", ".btnImage", function(e){
        var grid = $("#addtaxReceiptMgmtGrid").data("kendoExtGrid");
        var rows = grid.select();
        if(rows !== null) {
            var data = [];
            $.each(rows, function(idx, row){
                data.push(grid.dataItem(row));
            });
            //console.log(data);
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
                    , "sReceiptId":data[0].receiptId
                    , "sVinNo":data[0].vinNo
                    , "sParent":"addTaxReceipt"
                    , "callbackFunc":function(data){

                    }
                }
            }
        });
    });

    $('input[name="scanTaxPayerId"]').on('change', function(){
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

//billOcr.OCX 관련 정보 시작
nResult = -1;
strResult = "";
strImageName = "";

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
    }
    else {
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

    document.IDScanRecog.result.innerText = "";

    objBillOcr.SetFormTypes(document.IDScanRecog.BillType.value, 1);    // 영수증 타입
    objBillOcr.SetDeviceAdvancedParams(2,1);
    objBillOcr.SetDeviceAdvancedParams(6,0);
    objBillOcr.SetDeviceAdvancedParams(10,200);

    var now = new Date();
    var fileNmDt = leadingZeros(now.getFullYear(), 4) + leadingZeros(now.getMonth()+1, 2) + leadingZeros(now.getDate(), 2);
    var fileNmTm = leadingZeros(now.getHours(), 2) + leadingZeros(now.getMinutes(), 2) + leadingZeros(now.getSeconds(), 2);
    var imgFileNm = fileNmDt+fileNmTm;

    var Path = "c:\\ScanInfoImage\\";
    var index = imgFileNm;
    var strEx = ".jpg";
    var ImagePath;
    //var bHavePaper = 1;

    //while(bHavePaper) {
        index++;
        ImagePath = Path + index + strEx;
        nResult = objBillOcr.AcquireNewImage(ImagePath);

        nResult = objBillOcr.RecognizeForm();
        if(nResult == 0){
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
        //console.log(strResult);

        document.IDScanRecog.scanFileImgDir.value = recogResult;                             /* 로컬 이미지 경로 */
        document.IDScanRecog.scanReceiptCd.value  = objBillOcr.GetRecognizeResult(0);        /* 영수증코드 */
        document.IDScanRecog.scanReceiptNo.value  = objBillOcr.GetRecognizeResult(1);        /* 영수증번호 */
        var receiptDate = "20"+objBillOcr.GetRecognizeResult(2);
        receiptDate = receiptDate.substring(0, 4) + "-" + receiptDate.substring(4, 6) + "-" + receiptDate.substring(6, 8);
        document.IDScanRecog.scanReceiptIssDate.value = receiptDate;                         /* 영수증일자 */
        document.IDScanRecog.scanBuyNm.value      = objBillOcr.GetRecognizeResult(3);        /* 구매처 */
        document.IDScanRecog.scanTaxPayerId.value = objBillOcr.GetRecognizeResult(6);        /* 납세자실별번호 */
        $("#scanIncTotAmt").data("kendoExtNumericTextBox").value(objBillOcr.GetRecognizeResult(7));   /* 세금포함금액 */

        // base64로 인코딩된 data를 얻어온다.
        var base64ImageData = "data:image/jpg;base64,"+objBillOcr.FileAttrInfor(recogResult);
        //document.getElementById("scanImageView").src = base64ImageData;
        $("#scanBlob").val(window.btoa(base64ImageData));

        // 그리드 클리어
        $("#addtaxReceiptUploadGrid").data("kendoExtGrid").dataSource.data([]);

        // 읽어온 납세자 식별변호로 2급/위성 딜러 테이블에서 데이터 조회
        var jsonData = { sTaxPayerId:document.IDScanRecog.scanTaxPayerId.value };
        checkSecondDealer(jsonData);

        dms.notification.info("<spring:message code='sal.info.scanSuccess' />");
    }
}

function ClearInfo(){
    $("#secDlrTp").data("kendoExtDropDownList").setDataSource([]);
    clearSecDlr();

    $("#addtaxReceiptUploadGrid").data("kendoExtGrid").dataSource.data([]);

    document.IDScanRecog.scanFileImgDir.value = "";         /* 이미지경로 */
    document.IDScanRecog.scanReceiptCd.value  = "";         /* 영수증코드  */
    document.IDScanRecog.scanReceiptNo.value  = "";         /* 영수증번호 */
    document.IDScanRecog.scanReceiptIssDate.value = "";     /* 영수증일자 */
    document.IDScanRecog.scanBuyNm.value      = "";         /* 구매처 */
    document.IDScanRecog.scanTaxPayerId.value = "";         /* 납세자실별번호 */
    $("#scanIncTotAmt").data("kendoExtNumericTextBox").value(0);    /* 세금포함금액 */

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
                // init recogForm (LoadRecogKenal()) 인식핵심 로딩( 인식전 필히 먼저 핵심 로딩)
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
 * 테스트로 영수증 이미지파일로 읽을때 사용
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

    console.log("# file Search msg : "+nResult);

    document.IDScanRecog.result.innerText = "";

    objBillOcr.SetFormTypes(document.IDScanRecog.BillType.value, 1);    // 영수증 타입(3 : 부가세 영수증)
    objBillOcr.SetDeviceAdvancedParams(2,1);
    objBillOcr.SetDeviceAdvancedParams(6,0);
    objBillOcr.SetDeviceAdvancedParams(10,200);

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
        //console.log(strResult);

        //${"#scanReceiptCd"}.val(objBillOcr.GetRecognizeResult(0));     /* 영수증코드 */
        //${"#scanReceiptNo"}.val(objBillOcr.GetRecognizeResult(1));     /* 영수증번호  */
        //${"#scanTaxPayerId"}.val(objBillOcr.GetRecognizeResult(6));    /* 납세자실별번호 */
        //${"#scanIncTotAmt"}.val(objBillOcr.GetRecognizeResult(7));     /* 세금포함금액 */

        document.IDScanRecog.scanFileImgDir.value = recogResult;  /* 로컬 이미지 경로 */
        document.IDScanRecog.scanReceiptCd.value  = objBillOcr.GetRecognizeResult(0);         /* 영수증코드 */
        document.IDScanRecog.scanReceiptNo.value  = objBillOcr.GetRecognizeResult(1);         /* 영수증번호 */
        var receiptDate = "20"+objBillOcr.GetRecognizeResult(2);
        receiptDate = receiptDate.substring(0, 4) + "-" + receiptDate.substring(4, 6) + "-" + receiptDate.substring(6, 8);
        document.IDScanRecog.scanReceiptIssDate.value = receiptDate;     /* 영수증일자 */
        document.IDScanRecog.scanBuyNm.value      = objBillOcr.GetRecognizeResult(3);         /* 구매처 */
        document.IDScanRecog.scanTaxPayerId.value = objBillOcr.GetRecognizeResult(6);         /* 납세자실별번호 */
        $("#scanIncTotAmt").data("kendoExtNumericTextBox").value(objBillOcr.GetRecognizeResult(7));     /* 세금포함금액 */

        // 그리드 클리어
        $("#addtaxReceiptUploadGrid").data("kendoExtGrid").dataSource.data([]);

        // 읽어온 납세자 식별변호로 2급/위성 딜러 테이블에서 데이터 조회
        var jsonData = { sTaxPayerId:document.IDScanRecog.scanTaxPayerId.value };
        checkSecondDealer(jsonData);

        dms.notification.info("<spring:message code='sal.info.scanSuccess' />");
    }
}

// billOcr.OCX 관련 정보 끝

</script>
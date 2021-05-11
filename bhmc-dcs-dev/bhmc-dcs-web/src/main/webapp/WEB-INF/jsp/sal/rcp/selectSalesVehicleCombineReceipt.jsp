<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.sales-1.0.js' />"></script>

<!-- [DCS] 기동차통일영수증관리 -->
<section class="group">
    <div class="header_area">
        <h1 class="title_basic"><spring:message code='sal.title.VehicleCombineReceipt' /></h1>
    </div>

    <!-- 탭메뉴 전체 영역 -->
    <div id="mainTab" class="tab_area">
        <!-- 탭메뉴 -->
        <ul>
            <li id="receiptMgmt" class="k-state-active"><spring:message code='sal.title.ReceiptMgmt' /></li>
            <!-- 宫荣枢 2021-04-30 去掉DCS发票上传功能 -->
            <!--<li id="receiptUpload"><spring:message code='sal.title.ReceiptUpload' /></li>-->
        </ul>
        <!-- //탭메뉴 -->


        <!-- 영수증 관리 -->
        <div class="mt0" id="receiptMgmt">
            <section class="group">
                <div class="header_area">
                    <div class="btn_right">
                        <button type="button" class="btn_m btn_search" id="btnSearch" ><spring:message code='global.btn.search' /><!-- 조회 --></button>
                         <!-- R19111100817 保存按钮 去掉 贾明  2019-11-13  hidden button--> <!-- 저장 -->
                        <!--<button type="button" class="btn_m btn_save" id="btnSave" ><spring:message code='global.btn.save' /></button>-->
                        <button class="btn_m btn_save" id="btnExcel"><spring:message code="global.btn.excelExport" /></button> <!--下载-->
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
                                <!-- 开票店代码-->
                                <th scope="row"><spring:message code="sal.lbl.billDealer" /></th>
                                <td class="required_area">
                                    <input id="sDlrCds" name="sDlrCds" type="text" class="form_input" maxlength="8" style="text-transform:uppercase;">
                                </td>
                                <!-- 发票状态-->
                                <th scope="row"><spring:message code="global.lbl.receipt" /><spring:message code="sal.lbl.statNm" /></th>
                                <td class="required_area">
                                    <input id="sReceiptStatus" name="sReceiptStatus" type="text" class="form_comboBox">
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
                                <!-- 出库店代码-->
                                <th scope="row"><spring:message code="sal.btn.itemOut" /><spring:message code="sal.lbl.trsfDealer" /></th> <!-- 出库店代码 次月复核 R19080700284 贾明 2019-8-8-->
                                <td class="required_area">
                                    <input id="sOrdDlrCd" name="sOrdDlrCd" type="text" class="form_input" maxlength="8" style="text-transform:uppercase;">
                                </td>
                                <!-- 经销商代码-->
                                <th scope="row"><spring:message code="global.lbl.dlrCd" /></th>
                                <td class="required_area">
                                    <input id="sDlrCd" name="sDlrCd" type="text" class="form_input" maxlength="8" style="text-transform:uppercase;">
                                </td>
                            </tr>
                            <tr>
                                <!-- 事业部 -->
                                <th scope="row"><spring:message code="global.lbl.division" />
                                <td>
                                    <input id="sSdptCd" class="form_comboBox" />
                                </td>
                                <!-- 办事处 -->
                                <th scope="row"><spring:message code="sal.lbl.officeNm" />
                                <td>
                                    <input id="sDistOfficeCd" class="form_comboBox" />
                                </td>
                                <!-- 省 -->
                                <th scope="row"><spring:message code="global.lbl.sung" />
                                <td>
                                    <input id="sSungCd" class="form_comboBox" />
                                </td>
                                <!-- 经销商名称-->
                                <th scope="row"><spring:message code="global.lbl.dlrNm" /></th>
                                <td class="required_area">
                                    <input id="sDlrNm" name="sDlrNm" type="text" class="form_input" maxlength="8" style="text-transform:uppercase;">
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="header_area">
                </div>
                <div class="table_grid">
                    <div id="receiptMgmtGrid" class="resizable_grid"></div>
                </div>
            </section>
        </div>
        <!-- //영수증 관리 -->


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
                            <col style="width:15%;">
                            <col style="width:8%;">
                            <col style="width:10%;">
                        </colgroup>
                        <tbody>
                            <tr>
                                <th scope="row"><span class="bu_required"><spring:message code='global.lbl.dlrCd' /></span></th> <!-- 딜러코드 -->
                                <td>
                                    <input id="sDlrCd" name="sDlrCd" type="text" value="${dlrCd}" class="form_input"  style="width:30%"/>
                                    <input id="sSearchGubun" name="sSearchGubun" class="form_comboBox" onChange="clearSearchForm()"  style="width:68%"/>
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
                                <th scope="row"><spring:message code='sal.lbl.TaxBeforeReport' /></th> <!-- 세금기신고 -->
                                <td class="required_area">
                                    <input type="checkbox" id="sTaxBeforeChk" name="sTaxBeforeChk" class="form_check" />
                                </td>
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
                            <th scope="row"><spring:message code="sal.lbl.CarReceiptGubn" /></th>
                            <td class="readonly_area">
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
                                            <td><input type="text" id ="scanRcptPubDt" name="scanRcptPubDt" style="width:100%;background-color:transparent;text-align:left;border-style:none;font-weight:bold;" data-json-obj="true" ></td>
                                        </tr>
                                        <tr>
                                            <th scope="row"><spring:message code='sal.lbl.ReceiptCd' /></th>
                                            <td><input type="text" name="scanRcptCd" maxlength="12" style="width:100%;background-color:transparent;text-align:left;border-style:none;font-weight:bold;" data-json-obj="true" ></td>
                                        </tr>
                                        <tr>
                                            <th scope="row"><spring:message code='sal.lbl.rcptNo' /></th>
                                            <td><input type="text" name="scanRcptNo" maxlength="8" style="width:100%;background-color:transparent;text-align:left;border-style:none;font-weight:bold;" data-json-obj="true" ></td>
                                        </tr>
                                        <tr>
                                            <th scope="row"><spring:message code='sal.lbl.PayTaxPinNo' /></th>
                                            <td><input type="text" name="scanPayTaxPinNo" maxlength="30" style="width:100%;background-color:transparent;text-align:left;border-style:none;font-weight:bold;" data-json-obj="true" ></td>
                                        </tr>
                                        <tr>
                                            <th scope="row"><spring:message code='sal.lbl.PurchaseComInfo' /></th>
                                            <td><input type="text" name="scanCustInfo" maxlength="70" style="width:100%;background-color:transparent;text-align:left;border-style:none;font-weight:bold;" data-json-obj="true" ></td>
                                        </tr>
                                        <tr>
                                            <th scope="row"><spring:message code='sal.lbl.ssnCrnNo' /></th>
                                            <td><input type="text" name="scanSsnCrnNo" maxlength="50" style="width:100%;background-color:transparent;text-align:left;border-style:none;font-weight:bold;" data-json-obj="true" ></td>
                                        </tr>
                                        <tr>
                                            <th scope="row"><spring:message code='sal.lbl.carVinNo' /></th>
                                            <td><input type="text" name="scanVinNo" maxlength="17" style="width:100%;background-color:transparent;text-align:left;border-style:none;font-weight:bold;" data-json-obj="true" ></td>
                                        </tr>
                                        <tr>
                                            <th scope="row"><spring:message code='sal.lbl.certNo' /></th>
                                            <td><input type="text" name="scanCertNo" maxlength="30" style="width:100%;background-color:transparent;text-align:left;border-style:none;" data-json-obj="true" ></td>
                                        </tr>
                                        <tr>
                                            <th scope="row"><spring:message code='sal.lbl.engNo' /></th>
                                            <td><input type="text" name="scanEngNo" maxlength="15" style="width:100%;background-color:transparent;text-align:left;border-style:none;" data-json-obj="true" ></td>
                                        </tr>
                                        <tr>
                                            <th scope="row"><spring:message code='sal.lbl.TaxIncludeSumAmtNum' /></th>
                                            <td><input type="text" name="scanTaxIncPrice" style="width:100%;background-color:transparent;text-align:left;border-style:none;font-weight:bold;" data-json-obj="true" ></td>
                                        </tr>
                                        <tr>
                                            <th scope="row"><spring:message code='sal.lbl.TaxUndercoverageAmt' /></th>
                                            <td><input type="text" name="scanTaxExcPrice" style="width:100%;background-color:transparent;text-align:left;border-style:none;" data-json-obj="true" ></td>
                                        </tr>
                                        <tr>
                                            <th scope="row"><spring:message code='sal.lbl.taxRate' /></th>
                                            <td><input type="text" name="scanTaxRate" maxlength="8" style="width:100%;background-color:transparent;text-align:left;border-style:none;" data-json-obj="true" ></td>
                                        </tr>
                                        <tr>
                                            <th scope="row"><spring:message code='par.lbl.vatAmt' /></th>
                                            <td><input type="text" name="scanTaxAmt" style="width:100%;background-color:transparent;text-align:left;border-style:none;" data-json-obj="true" ></td>
                                        </tr>
                                        <tr>
                                            <th scope="row"><spring:message code='sal.lbl.SalesComNm' /></th>
                                            <td><input type="text" name="scanSaleCmpnNm" maxlength="200" style="width:100%;background-color:transparent;text-align:left;border-style:none;" data-json-obj="true" ></td>
                                        </tr>
                                        <tr>
                                            <th scope="row"><spring:message code='par.lbl.addr' /></th>
                                            <td><input type="text" name="scanSaleCmpnAddr" maxlength="99" style="width:100%;background-color:transparent;text-align:left;border-style:none;" data-json-obj="true" ></td>
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
              <!-- 贾明 2020-5-21 下载 -->
            <div id="excelProgress" class="demo-section k-content mt10">
               <h4>Excel Export</h4>
               <div id="progressBar"></div>
            </div>
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

/** 딜러구분 **/
var searchTpCdList = [];
<c:forEach var="obj" items="${searchTpCdList}">
searchTpCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var searchTpCdArr = dms.data.arrayToMap(searchTpCdList, function(obj){return obj.cmmCd;});

/** 2급망 유형 **/
var secDlrGbList = [];
<c:forEach var="obj" items="${secDlrGbList}">
secDlrGbList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}"});
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

var sdptDs = [];
<c:forEach var="obj" items="${sdptList}">
    sdptDs.push({"sdptCd":"${obj.sdptCd}", "sdptNm":"${obj.sdptNm}"});
</c:forEach>

var sungCdDs = [];
<c:forEach var="obj" items="${sungList}">
    sungCdDs.push({"saleDlrSungCd":"${obj.saleDlrSungCd}", "saleDlrSungNm":"${obj.saleDlrSungNm}"});
</c:forEach>

/** 심사 통과, 미통과 **/
/** R19080700284 初审 \次月复核查询条件及展示 贾明 2019-8-8  start**/
var applyYnList = [];
<c:forEach var="obj" items="${certYnList}">
   applyYnList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}"});
</c:forEach>
var applyYnMap = dms.data.arrayToMap(applyYnList, function(obj){ return obj.cmmCd; });
/** R19080700284 初审 、次月复核查询条件及展示 贾明 2019-8-8  end **/
//R19111100817 增加申请记录 选择项，查询条件 贾明 2019-11-14 start

// 发票验证状态 宫荣枢 2021-04-27
var sCertfstScan = [];
<c:forEach var="obj" items="${sCertFst}">
    sCertfstScan.push({"cmmCd":"${obj.cmmCd}","cmmCdNm":"${obj.cmmCdNm}"});
</c:forEach>

// 发票状态 宫荣枢 2021-04-27
var sReceiptStatusArr = [];
<c:forEach var="obj" items="${sReceiptStatus}">
    sReceiptStatusArr.push({"cmmCd":"${obj.cmmCd}","cmmCdNm":"${obj.cmmCdNm}"});
</c:forEach>

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

//var applyYnList = [{"cmmCd":"1", "cmmCdNm":"通过"}, {"cmmCd":"0", "cmmCdNm":"未通过"}, {"cmmCd":"2", "cmmCdNm":"待审批"}];
var applyYnMap = dms.data.arrayToMap(applyYnList, function(obj){ return obj.cmmCd; });

// 发票验证状态 宫荣枢 2021-04-27
var certFstMap = dms.data.arrayToMap(sCertfstScan, function(obj){ return obj.cmmCd; });
// 发票状态 宫荣枢 2021-04-27
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

 // 사업부
    $("#sSdptCd").kendoExtDropDownList({
        dataTextField:"sdptNm"
       ,dataValueField:"sdptCd"
       ,dataSource:sdptDs
       ,optionLabel:" "
       ,index:0
       ,select :function(e){
           $("#sDistOfficeCd").data("kendoExtDropDownList").setDataSource([]);
           $("#sDistOfficeCd").data("kendoExtDropDownList").enable(true);

           var dataItem = this.dataItem(e.item);
           if(dataItem.sdptCd == ""){
               $("#sDistOfficeCd").data("kendoExtDropDownList").setDataSource([]);
               $("#sDistOfficeCd").data("kendoExtDropDownList").enable(false);
               return false;
           }

           var responseJson = dms.ajax.getJson({
               url :"<c:url value='/sal/cmm/selectDealerOffice.do'/>"
               ,data :JSON.stringify({"sSdptCd":dataItem.sdptCd})
               ,async :false
           });

           if(responseJson == null || responseJson.data == null){
               responseJson.data = [];
           }

           $("#sDistOfficeCd").data("kendoExtDropDownList").setDataSource(responseJson.data);
       }
    });
    //사무소
    $("#sDistOfficeCd").kendoExtDropDownList({
        dataTextField:"distOfficeNm"
        ,dataValueField:"distOfficeCd"
        ,optionLabel:" "
    });
    $("#sDistOfficeCd").data("kendoExtDropDownList").enable(false);
    //성
    $("#sSungCd").kendoExtDropDownList({
        dataTextField:"saleDlrSungNm"
       ,dataValueField:"saleDlrSungCd"
       ,optionLabel:" "
       ,dataSource:sungCdDs
    });
    
    // 发票状态 宫荣枢 2021-04-27
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
        //,dataSource:secDlrGbList
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

    //버튼 - 엑셀다운로드
    /**
    $("#btnExcel").kendoButton({
        click:function(e) {

            dms.ajax.excelExport({
                "beanName":"salesVhclCbinRcitService"
                ,"templateFile":"SalesVhclCbinRcit.xlsx"
                ,"fileName":"<spring:message code='sal.menu.ReceiptScanHistMgmt' />.xlsx"

                ,"sVinNo":$("#sVinNo").val()
                ,"sReceiptNo":$("#sReceiptNo").val()
                ,"sVinType":$("#sVinType").val()
                ,"sCustSaleStDt":kendo.toString(kendo.parseDate($("#sCustSaleStDt").data("kendoExtMaskedDatePicker").value()), "<dms:configValue code='dateFormat' />")  //R20042000502下载和查询数据量不一致 贾明 2020-4-28 
                ,"sCustSaleEdDt":kendo.toString(kendo.parseDate($("#sCustSaleEdDt").data("kendoExtMaskedDatePicker").value()), "<dms:configValue code='dateFormat' />")  //R20042000502下载和查询数据量不一致 贾明 2020-4-28
                ,"sUploadStat":$("#sUploadStat").val()
                ,"sReceiptStDt":kendo.toString(kendo.parseDate($("#sReceiptStDt").data("kendoExtMaskedDatePicker").value()), "<dms:configValue code='dateFormat' />")   //R20042000502下载和查询数据量不一致 贾明 2020-4-28
                ,"sReceiptEdDt":kendo.toString(kendo.parseDate($("#sReceiptEdDt").data("kendoExtMaskedDatePicker").value()), "<dms:configValue code='dateFormat' />")   //R20042000502下载和查询数据量不一致 贾明 2020-4-28
                ,"sUploadStDt":kendo.toString(kendo.parseDate($("#sUploadStDt").data("kendoExtMaskedDatePicker").value()), "<dms:configValue code='dateFormat' />")     //R20042000502下载和查询数据量不一致 贾明 2020-4-28
                ,"sUploadEdDt":kendo.toString(kendo.parseDate($("#sUploadEdDt").data("kendoExtMaskedDatePicker").value()), "<dms:configValue code='dateFormat' />")    //R20042000502下载和查询数据量不一致 贾明 2020-4-28
                ,"sSdptCd":$("#sSdptCd").data("kendoExtDropDownList").value()
                ,"sDistOfficeCd":$("#sDistOfficeCd").data("kendoExtDropDownList").value()
                ,"sSungCd":$("#sSungCd").data("kendoExtDropDownList").value()
                ,"sDealercd": $("#sDealercd").val()  //R19080700284 初审 、上传店代码 、 次月复核 、出库店代码 查询条件 贾明 2019-8-8 start
                ,"sCertfst":$("#sCertfst").val()
                ,"sCertnd":$("#sCertnd").val()
                ,"sOrdDlrCd":$("#sOrdDlrCd").val()  //R19080700284 初审 、上传店代码 、 次月复核 、出库店代码 查询条件 贾明 2019-8-8 end 
                ,"sAppliRecode": $("#appliRecode").val() //R19111100817 增加申请记录 选择项，查询条件 贾明 2019-11-14
                        
            });

        }
    });
    **/
    //DCS 发票下载更改 贾明 2020-5-21 start
    $("#btnExcel").kendoButton({
        click:function(e) {
        
            var param = $.extend(
                 {"sVinNo":$("#sVinNo").val()}
                ,{"sReceiptNo":$("#sReceiptNo").val()}
                ,{"sCustSaleStDt":$("#sCustSaleStDt").data("kendoExtMaskedDatePicker").value()}  //R20042000502下载和查询数据量不一致 贾明 2020-4-28 
                ,{"sCustSaleEdDt":$("#sCustSaleEdDt").data("kendoExtMaskedDatePicker").value()}  //R20042000502下载和查询数据量不一致 贾明 2020-4-28
                ,{"sReceiptStDt":$("#sReceiptStDt").data("kendoExtMaskedDatePicker").value()}   //R20042000502下载和查询数据量不一致 贾明 2020-4-28
                ,{"sReceiptEdDt":$("#sReceiptEdDt").data("kendoExtMaskedDatePicker").value()}   //R20042000502下载和查询数据量不一致 贾明 2020-4-28
                ,{"sSdptCd":$("#sSdptCd").data("kendoExtDropDownList").value()}
                ,{"sDistOfficeCd":$("#sDistOfficeCd").data("kendoExtDropDownList").value()}
                ,{"sSungCd":$("#sSungCd").data("kendoExtDropDownList").value()}
                ,{"sDlrCd": $("#sDlrCd").val()}
                ,{"sDlrCds": $("#sDlrCds").val()}
                ,{"sOrdDlrCd":$("#sOrdDlrCd").val()}  //R19080700284 初审 、上传店代码 、 次月复核 、出库店代码 查询条件 贾明 2019-8-8 end 
                    
            );
            
             // 获取要下载行数
            $.ajax({
                url:"<c:url value='/sal/rcp/selectSalesVehicleCombineReceiptSearchCnt.do' />"
                ,data:JSON.stringify(param)
                ,type:'POST'
                ,dataType:'json'
                ,contentType:'application/json'
                ,error:function(jqXHR, status, error){
                    dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                }
                ,success:function(result){

                   var maxRow = 30000;
                   var fileCnt = 0;
                   var downCnt = 0;
                   var totRow = result.total;
                   fileCnt = Math.ceil(totRow / maxRow);
                   //console.log("maxRow : "+maxRow+", totRow : "+totRow+", fileCnt : "+fileCnt);

                   callExcelDownload(0, maxRow, maxRow, fileCnt, downCnt);

               }
           });
            
        }
    });
    
    callExcelDownload = function(firstIdx, lastIdx, maxRow, fileCnt, downCnt){
        //showProgressBar();
        dms.ajax.excelProgressExport({
                "beanName":"salesVhclCbinRcitService"
                ,"templateFile":"SalesVhclCbinRcit.xlsx"
                ,"fileName":"<spring:message code='sal.menu.ReceiptScanHistMgmt' />.xlsx"
                ,"sVinNo":$("#sVinNo").val()
                ,"sReceiptNo":$("#sReceiptNo").val()
                ,"sCustSaleStDt":$("#sCustSaleStDt").val()  //R20042000502下载和查询数据量不一致 贾明 2020-4-28 
                ,"sCustSaleEdDt":$("#sCustSaleEdDt").val()  //R20042000502下载和查询数据量不一致 贾明 2020-4-28
                ,"sReceiptStDt":$("#sReceiptStDt").val()   //R20042000502下载和查询数据量不一致 贾明 2020-4-28
                ,"sReceiptEdDt":$("#sReceiptEdDt").val()  //R20042000502下载和查询数据量不一致 贾明 2020-4-28
                ,"sSdptCd":$("#sSdptCd").data("kendoExtDropDownList").value()
                ,"sDistOfficeCd":$("#sDistOfficeCd").data("kendoExtDropDownList").value()
                ,"sSungCd":$("#sSungCd").data("kendoExtDropDownList").value()
                ,"sDlrCd": $("#sDlrCd").val()
                ,"sDlrCds": $("#sDlrCds").val()
                ,"sOrdDlrCd":$("#sOrdDlrCd").val()  //R19080700284 初审 、上传店代码 、 次月复核 、出库店代码 查询条件 贾明 2019-8-8 end 
                ,"firstIndex"           :firstIdx
                ,"lastIndex"            :lastIdx
        }, maxRow, fileCnt, downCnt);
    };
    // Excel Export 상태바 状态栏
    $("#progressBar").kendoProgressBar({
        min: 0,
        max: 100,
        type: "percent",
        change: onChange,
        complete: onComplete
    });
    showProgressBar = function(){
        $("#excelProgress").slideDown();
    };

    hideProgressBar = function(){
        $("#excelProgress").slideUp();
    };
    // progress bar 숨김 隐藏
    hideProgressBar();
   function onChange(e) {
    //console.log("Change event :: value is " + e.value);
    }

   function onComplete(e) {
    //console.log("Complete event :: value is " + e.value);
    //$("#startProgress").text("Restart Progress").removeClass("k-state-disabled");
       hideProgressBar();
    }
   //DCS 发票下载更改 贾明 2020-5-21 end
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
                        dms.notification.error(jqXHR.responseJSON.errors);
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

    // 영수증 관리 그리드 설정
    $("#receiptMgmtGrid").kendoExtGrid({
        gridId:"G-SAL-0430-165554"
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
                        params["sDlrCds"] = $("#sDlrCds").val();
                        params["sReceiptNo"] = $("#sReceiptNo").val();
                        params["sCustSaleStDt"] = $("#sCustSaleStDt").data("kendoExtMaskedDatePicker").value();
                        params["sCustSaleEdDt"] = $("#sCustSaleEdDt").data("kendoExtMaskedDatePicker").value();
                        params["sReceiptStDt"] = $("#sReceiptStDt").data("kendoExtMaskedDatePicker").value();
                        params["sReceiptEdDt"] = $("#sReceiptEdDt").data("kendoExtMaskedDatePicker").value();
                        params["sOrdDlrCd"] = $("#sOrdDlrCd").val();
                        params["sReceiptStatus"] = $("#sReceiptStatus").val();
                        params["sSdptCd"] = $("#sSdptCd").data("kendoExtDropDownList").value();
                        params["sDistOfficeCd"] = $("#sDistOfficeCd").data("kendoExtDropDownList").value();
                        params["sSungCd"] = $("#sSungCd").data("kendoExtDropDownList").value();
                        params["sDlrCd"] = $("#sDlrCd").val();
                        params["sDlrNm"] = $("#sDlrNm").val();

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
                        ,errUpCd:{type:"string", editable:true }
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
                        ,sdptNm:{type:"string", editable:false}
                        ,offNm:{type:"string", editable:false}
                        ,sungNm:{type:"string", editable:false}
                        
                    }
                }

                ,parse:function(d) {
                    if(d.data){
                        $.each(d.data, function(idx, elem) {
                            elem.rnum = d.total - elem.rnum + 1;
                            elem.custSaleDt = kendo.parseDate(elem.custSaleDt, "<dms:configValue code='dateFormat' />");
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
       // ,multiSelectWithCheckbox:true     //멀티선택 적용. default:false
        ,appendEmptyColumn:false           //빈컬럼 적용. default:false
        ,enableTooltip:true               //Tooltip 적용, default:false
        ,sortable:true
        ,autoBind:false
        ,editable:false
        ,edit:function(e){
            var grid = $("#receiptMgmtGrid").data("kendoExtGrid");
            var selectedVal = grid.dataItem(grid.select());
            if(!dms.string.isEmpty(selectedVal.receiptNo)){
                this.closeCell();
            }
        }
        ,columns:[
            // 发票明细
            {field:"receiptItemDesc", title:"<spring:message code='sal.lbl.ReceiptItemDesc' />", width:60, sortable:false
                ,attributes:{"class":"ac"}
                ,template:function(dataItem){
                    if(!dms.string.isEmpty(dataItem.receiptNo)){
                       return "<a href='#' class='btnDetail'><span class='txt_label bg_blue'><spring:message code='global.btn.search' /></span></a>";
                    }
                    return "";
                }
            }
            ,{field:"receiptImage", title:"<spring:message code='sal.lbl.image' />", width:60, sortable:false
                ,attributes:{"class":"ac"}
                ,template:function(dataItem) {
                   if (!dms.string.isEmpty(dataItem.receiptNo)) {
                       return "<a href='#' class='btnImage'><span class='txt_label bg_yellow'><spring:message code='global.btn.search' /></span></a>";
                   }
                   return "";
                }
            }
            ,{field:"vinNo", title:"<spring:message code='sal.lbl.carVinNo' />", width:150, attributes:{"class":"ac"}}  /* VIN */
            ,{field:"dlrCd", title:"<spring:message code='sal.lbl.billDealer' />", width:100, attributes:{"class":"ac"}}      /*上传店代码  R19080700284 贾明 2019-8-8 <spring:message code='sar.lbl.dlrCd' />*/
            ,{field:"ordDlrCd", title:"<spring:message code='sal.btn.itemOut' /><spring:message code='sal.lbl.trsfDealer' />", width:100, attributes:{"class":"ac"}}      /* 出库店代码  ordDlrCd R19080700284 贾明 2019-8-8*/
            ,{field:"carlineNm", title:"<spring:message code='global.lbl.carlineNm' />", width:120, sortable:false}      /* 车种R19080700284 贾明 2019-8-8 */
            ,{field:"ocnCd", title:"<spring:message code='global.lbl.ocn' />", width:120, sortable:false}                    /* OCN代码 宫荣枢 2021-04-25 */
            ,{field:"ocnNm", title:"<spring:message code='sal.lbl.ocnDesc' />", width:120, sortable:false}                   /* OCN描述 宫荣枢 2021-04-25 */
            ,{field:"extColorCd", title:"<spring:message code='global.lbl.extColorCd' />", width:120, sortable:false}        /* 外色代码 宫荣枢 2021-04-25 */
            ,{field:"extColorNm", title:"<spring:message code='global.lbl.extColorNm' />", width:120, sortable:false}        /* 外色名称 宫荣枢 2021-04-25 */
            ,{field:"intColorCd", title:"<spring:message code='global.lbl.intColorCd' />", width:120, sortable:false}        /* 内色代码 宫荣枢 2021-04-25 */
            ,{field:"manufactYyMmDt", title:"<spring:message code='global.lbl.creDt' />", width:120, sortable:false}        /* 生产日期 宫荣枢 2021-04-25 */
            ,{field:"pltGiDt", title:"<spring:message code='sal.lbl.factoryOutDate' />", sortable:false}          /* 工厂出库日期 宫荣枢 2021-04-25 */
            ,{field:"modelNm", title:"<spring:message code='global.lbl.model' />", width:120, sortable:false}      /* 车款 R19080700284 贾明 2019-8-8*/
            ,{field:"msPrc", title:"<spring:message code='sal.lbl.carRetlAmt' />", width:120, attributes:{"class":"ar"},format:"{0:n2}"}      /*指导价 R19080700284 贾明 2019-8-8 */
            // 发票状态 宫荣枢 2021-04-27
            ,{field:"receiptStatus", title:"<spring:message code='global.lbl.receipt' /><spring:message code='sal.lbl.statNm' />", width:70, sortable:false
                , template:"# if(receiptStatusMap[receiptStatus] != null) { # #= receiptStatusMap[receiptStatus].cmmCdNm# # }#"
            }
            ,{field:"sumAmt", title:"<spring:message code='sal.lbl.realCarAmts' />", width:120, attributes:{"class":"ar"},format:"{0:n2}"}    /*开票价即价格合计小写*/
            ,{field:"custNm", title:"<spring:message code='sal.lbl.publNm' />", width:90, hidden:true}                               /* 고객이름客户姓名 隐藏 CRS 37 贾明 2019-12-12 */
            ,{field:"custSsnCrnNo", title:"<spring:message code='ser.lbl.certNo' />", width:130, hidden:true}                        /* 고객증서번호  证件号码 隐藏 CRS 37 贾明 2019-12-12*/
            ,{field:"chkSsnCrnNo", title:"<spring:message code='sal.lbl.cmprAcntRcpt' />", width:100, attributes:{"class":"ac"}, sortable:false,hidden:true
                ,template:"# if(useYnMap[chkSsnCrnNo] != null) { # #= useYnMap[chkSsnCrnNo].cmmCdNm# # }#"
            } /* 영수인과 계약인 일치여부 客户证件号码是否一致 隐藏 CRS 37 贾明 2019-12-12*/
            ,{field:"taxpayerIdCd", title:"<spring:message code='sal.lbl.PinNo' />", width:140, sortable:false }         /* 식별번호 */
            ,{field:"receiptNo", title:"<spring:message code='sal.lbl.rcptNo' />", width:80, sortable:false}             /* 영수증 번호 */
            ,{field:"receiptCustNm", title:"<spring:message code='ser.lbl.rcptPerson' />", width:90, sortable:false}     /* 영수증인 */
            ,{field:"ssnCrnNo", title:"<spring:message code='ser.lbl.rcptCertNo' />", width:130, sortable:false}           /* 증서번호 */
            ,{field:"custSaleDt", title:"<spring:message code='sal.lbl.retlDt' />", width:90
                ,format: "{0:<dms:configValue code='dateFormat' />}"
                ,attributes:{"class":"ac"}
             }          /* 소매일자 */
            ,{field:"receiptIssDt", title:"<spring:message code='sal.lbl.ReceiptPubDt' />", width:90
                    ,attributes:{"class":"ac"}
                    ,format: "{0:<dms:configValue code='dateFormat' />}"
            }       /* 영수증 발행일자 */
            ,{field:"regDtFormat", title:"<spring:message code='sal.lbl.uploadDt' />", width:90, sortable:false
                 ,attributes:{"class":"ac"}
                 ,format: "{0:<dms:configValue code='dateFormat' />}"

            }
            // 发票验证结果 宫荣枢 2021-04-27
            ,{field:"certFst", title:"<spring:message code='sal.lbl.InvoiceVerificationResult' />", width:100, sortable:false
                , template:"# if(certFstMap[certFst] != null) { # #= certFstMap[certFst].cmmCdNm# # }#"
            }
            ,{field:"sdptNm", title:"<spring:message code='global.lbl.division' />", width:90, sortable:false}
            ,{field:"offNm", title:"<spring:message code='global.lbl.dist' />", width:90, sortable:false}
            ,{field:"sungNm", title:"<spring:message code='global.lbl.sung' />", width:120, sortable:false}
            ,{field:"dlrNm", title:"<spring:message code='global.lbl.dlrNm' />", width:150, sortable:false}
             // 隐藏美丽源验证情况 宫荣枢 2021-04-26
            ,{
                _field:"_ScreenStatus",
                title: "<spring:message code='sal.info.verificationSituation' />", /* CRS 77 DMS、DCS机动车统一发票管理画面，审核情况改为 验证情况   贾明 2020-4-27심사상황   sal.info.verificationSituation sal.lbl.ScreenStatus */
                headerAttributes:{ "class":"hasBob" },
                columns: [
                  {field: "certFst", title: "<spring:message code='sal.lbl.FirstScreen' />", width: 60, sortable:false, filterable:false
                      , template:"# if(applyYnMap[certFst] != null) { # #= applyYnMap[certFst].cmmCdNm# # }#" } /* 초심 */
                 ,{field: "cert2nd", title: "<spring:message code='sal.lbl.MonthScreenAgain' />", width: 60, sortable:false, filterable:false
                     , template:"# if(applyYnMap[cert2nd] != null) { # #= applyYnMap[cert2nd].cmmCdNm# # }#"  } /* 익월재심 */
                 ,{field: "cert3rd", title: "<spring:message code='sal.lbl.QuarterScreenAgain' />", width: 60, sortable:false, filterable:false,hidden:true
                     , template:"# if(applyYnMap[cert3rd] != null) { # #= applyYnMap[cert3rd].cmmCdNm# # }#"  } /* 분기재심 */
                ]
                , hidden:true
            }
            ,{field:"taxChkYn", title:"<spring:message code='sal.lbl.TaxBeforeReport' />", width:70, attributes:{"class":"ac"}, sortable:false,hidden:true
                ,template:"# if(useYnMap[taxChkYn] != null) { # #= useYnMap[taxChkYn].cmmCdNm# # }#"
            }           /* 세금기신고여부 crs 37 需求 已报税 删除 即隐藏 贾明 2019-12-12*/
            // 隐藏二网相关 宫荣枢 2021-04-26
            ,{field:"sdlrCd", title:"<spring:message code='sal.lbl.lv2Cd' />", width:70, attributes:{"class":"ac"}, sortable:false
                ,template:function(dataItem){
                    if(dataItem.sdlrTp != "EW" && dataItem.sdlrTp != "WX"){
                        return "";
                    }else{
                        return dms.string.strNvl(dataItem.sdlrCd);
                    }
                }
                , hidden:true
            }                   /* 2급망코드(판매) */
            ,{field:"sdlrTp", title:"<spring:message code='sal.lbl.Slv2DlrType' />", width:70, attributes:{"class":"ac"}, sortable:false
                ,template:function(dataItem){
                    if(dataItem.sdlrTp != "EW" && dataItem.sdlrTp != "WX"){
                        return "";
                    }else{
                        return dms.string.strNvl(secDlrGbMap[dataItem.sdlrTp].cmmCdNm);
                    }
                }
                , hidden:true
            }                   /* 2급망 유형 */
            ,{field:"sdlrNm", title:"<spring:message code='sal.lbl.sdlrNm' />", width:70, attributes:{"class":"ac"}, sortable:false
                ,template:function(dataItem){
                    if(dataItem.sdlrTp != "EW" && dataItem.sdlrTp != "WX"){
                        return "";
                    }else{
                        return dms.string.strNvl(dataItem.sdlrNm);
                    }
                }
                , hidden:true
            }                   /* 2급망 명칭 */
            // 隐藏录入人、有无增票、增票号、上传状态、未上传原因
            ,{field:"regUsrId", title:"<spring:message code='global.lbl.regUsrId' />", width:70, sortable:false, hidden:true}                   /* 등록자id */
            ,{field:"addtaxReceiptYn", title:"<spring:message code='sal.lbl.vatRcptYn' />", width:70, attributes:{"class":"ac"}, sortable:false
                ,template:"# if(existYnMap[addtaxReceiptYn] != null) { # #= existYnMap[addtaxReceiptYn].cmmCdNm# # }#"
                , hidden:true
            } /* 증표유무 */
            ,{field:"addtaxReceiptNo", title:"<spring:message code='sal.lbl.vatRcptNo' />", width:100, sortable:false, hidden:true}                   /* 증표호 */
            ,{field:"uploadStat", title:"<spring:message code='sal.lbl.statNm' />", width:80, sortable:false
                ,attributes:{"class":"ac"}
                ,template:function(dataItem){
                    var returnObj = "";
                    if(dataItem.uploadStat != undefined){
                        returnObj = uploadStatCdGrid(dataItem.uploadStat);
                    }
                    return returnObj ;
                }
                , hidden:true
            }       /* 상태 */
            ,{field:"errUpCd", title:"<spring:message code='sal.lbl.UnUploadCause' />", width:90, sortable:false
                ,attributes:{"class":"al"}
                ,template:"# if(dstbChnCdMap[errUpCd] != null) { # #= dstbChnCdMap[errUpCd].cmmCdNm# # }#"
                ,editor:function(container, options) {
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
            }       /* 미업로드 원인 */
        ]
    });
    // 영수증 관리 그리드 종료

    // 发票明细
    $(document).on("click", ".btnDetail", function(e){
        var grid = $("#receiptMgmtGrid").data("kendoExtGrid");
        var rows = grid.select();
        if (rows !== null) {
            var data = [];
            $.each(rows, function(idx, row) {
                data.push(grid.dataItem(row));
            });
        }

        receiptDetailPopupWindow = dms.window.popup({
            windowId : "receiptDetailPopupWindow",
            title : "<spring:message code='sal.lbl.ReceiptItemDesc' />",
            modal : true,
            draggable : true,
            height : 450,
            width  : 600,
            content : {
                url : "<c:url value='/sal/rcp/selectReceiptDetailPopup.do'/>",
                data : {
                    "autoBind" : true,
                    "sCarId" : data[0].carId,
                    "sVinNo" : data[0].vinNo,
                    "sReceiptNo" : data[0].receiptNo, //R19111100817 一台车提交了两个不同号的发票，应该显示两行，目前只显示了一行。同时希望可以像<新能源补贴申请审核>页面类似的，可显示全部和最新的数据 贾明 2019-11-11
                    "callbackFunc" : function(data) {

                    }
                }
            }
        });
    });

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
            // 조회한 VIN
            if($("#cVinNo").val() == ""){
                dms.notification.warning("<spring:message code='sal.lbl.vinInputChkMsg' />");
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
                dms.notification.warning("<spring:message code='global.err.checkDateValue' />");
                $("#scanRcptPubDt").focus();
                return;
            }

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


            if(dms.string.isEmpty($('input[name="scanTaxIncPrice"]').val())){
                dms.notification.info("<spring:message code='sal.lbl.TaxIncludeSumAmtNum' var='salLblTaxIncludeSumAmtNum' /><spring:message code='global.info.emptyCheckParam' arguments='${salLblTaxIncludeSumAmtNum}' />");
                return;
            }

            if(dms.string.isEmpty($('input[name="scanTaxExcPrice"]').val())){
                dms.notification.info("<spring:message code='sal.lbl.TaxUndercoverageAmt' var='salLblTaxUndercoverageAmt' /><spring:message code='global.info.emptyCheckParam' arguments='${salLblTaxUndercoverageAmt}' />");
                return;
            }

            if(dms.string.isEmpty($('input[name="scanTaxRate"]').val())){
                dms.notification.info("<spring:message code='sal.lbl.taxRate' var='salLblTaxRate' /><spring:message code='global.info.emptyCheckParam' arguments='${salLblTaxRate}' />");
                return;
            }

            if(dms.string.isEmpty($('input[name="scanTaxAmt"]').val())){
                dms.notification.info("<spring:message code='par.lbl.vatAmt' var='parLblVatAmt' /><spring:message code='global.info.emptyCheckParam' arguments='${parLblVatAmt}' />");
                return;
            }

            if(dms.string.isEmpty($('input[name="scanSaleCmpnNm"]').val())){
                dms.notification.info("<spring:message code='sal.lbl.SalesComNm' var='salLblSalesComNm' /><spring:message code='global.info.emptyCheckParam' arguments='${salLblSalesComNm}' />");
                return;
            }

            if(dms.string.isEmpty($('input[name="scanSaleCmpnAddr"]').val())){
                dms.notification.info("<spring:message code='par.lbl.addr' var='parLblAddr' /><spring:message code='global.info.emptyCheckParam' arguments='${parLblAddr}' />");
                return;
            }
            if( $("#secDlrTp").data('kendoExtDropDownList').dataSource.data().length > 1
              && dms.string.isEmpty($("#secDlrTp").data('kendoExtDropDownList').value()) ){
                dms.notification.info("<spring:message code='sal.lbl.CarReceiptGubn' var='salLblCarReceiptGubn' /><spring:message code='global.info.emptyCheckParam' arguments='${salLblCarReceiptGubn}' />");
                return;
            }

            var param = $("#IDScanRecog").serializeObject($("#IDScanRecog").serializeArrayInSelector("[data-json-obj='true']"));
            param.carId = $("#cCarId").val();
            param.vinNo = $("#cVinNo").val();
            param.ordDlrCd = $("#sDlrCd").val();
            param.secDlrCd = $("#secDlrCd").val();
            param.taxBeforeChk = $("#sTaxBeforeChk").prop("checked") == true ? "Y" : "N";
            param.taxSungCd = $("#sArea").data("kendoExtDropDownList").value();
            param.sdlrTp = $("#secDlrTp").data("kendoExtDropDownList").value();
            param.sdlrNm = $("#secDlrNm").val();

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
                    ClearInfo();
                }
            });
       }
    });

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
                           $("#sDlrCd").val(data[0].dlrCd);
                           if("${dlrCd}" != data[0].dlrCd){
                               $("#sSearchGubun").data("kendoExtDropDownList").value("OD");
                           }else{
                               $("#sSearchGubun").data("kendoExtDropDownList").value("MD");
                           }
                           $("#rVinNo").val(data[0].vinNo);
                           $("#cCarId").val(data[0].carId);
                           $("#cVinNo").val(data[0].vinNo);
                           $("#cVinStat").val(data[0].carStatCd);
                       }
                       vinNoSearchPopupWindow.close();
                   }
               }
           }
       });
    };

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

// billOcr.OCX 관련 정보 시작
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
    objBillOcr.SetDeviceAdvancedParams(2,1);
    objBillOcr.SetDeviceAdvancedParams(6,0);
    objBillOcr.SetDeviceAdvancedParams(10,10);

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

        nResult = objBillOcr.RecognizeForm();
        if (nResult == 0) {
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

    var output = [];
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

    objBillOcr.SetFormTypes(document.IDScanRecog.BillType.value, 1);    // 영수증 타입(1 : 기동차 영수증)
    objBillOcr.SetDeviceAdvancedParams(2,1);
    objBillOcr.SetDeviceAdvancedParams(6,0);
    objBillOcr.SetDeviceAdvancedParams(10,10);

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

 // billOcr.OCX 관련 정보 끝

</script>
<style>
    #progressBar {
        display: block;
        width: 100%;
        margin-bottom: 10px;
    }
 </style>
<!-- [DMS] 기동차통일영수증관리 -->
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<%--
    JSP Name : selectSalesAddTaxReceipt_.jsp
    Description : 영수증관리 > 부가세영수증관리
    author chibeom.song
    since 2017. 2. 17.
    version 1.0
    Modification Information
       since          author              description
    ===========    =============    ===========================
    2017. 2. 17.   chibeom.song     최초 생성
--%>

<!-- [DMS] 부가세영수증관리 -->
<section class="group">
    <div class="header_area">
        <h1 class="title_basic"><spring:message code='sal.title.AddTaxReceipt' /></h1>
    </div>

    <!-- 탭메뉴 전체 영역 -->
    <div id="mainTab" class="tab_area">
        <!-- 탭메뉴 -->
        <ul>
            <li id="addtaxReceiptMgmt" class="k-state-active"><spring:message code='sal.title.AddTaxReceiptMgmt' /></li>
            <li id="addtaxReceiptUpload"><spring:message code='sal.title.AddTaxReceiptUpload' /></li>
        </ul>
        <!-- //탭메뉴 -->


        <!-- 부가세 영수증 관리 -->
        <div class="mt0" id="addtaxReceiptMgmt">
            <section class="group">
                <div class="header_area">
                    <div class="btn_right">
                        <button type="button" class="btn_s btn_search" id="btnSearch" ><spring:message code='global.btn.search' /><!-- 조회 --></button>
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
                            <col style="width:10%;">
                            <col style="width:12%;">
                            <col style="width:8%;">
                            <col style="width:12%;">
                        </colgroup>
                        <tbody>
                            <tr>
                                <th scope="row"><spring:message code="global.lbl.vinNo" /></span></th> <!-- VIN -->
                                <td class="required_area">
                                    <input id="sVinNo" name="sVinNo" type="text" class="form_input">
                                </td>
                                <th scope="row"><spring:message code="sal.lbl.invoiceNo" /></span></th> <!-- 영수증 번호 -->
                                <td class="required_area">
                                    <input id="sReceiptNo" name="sReceiptNo" type="text" class="form_input">
                                </td>
                                <th scope="row"><spring:message code="sal.lbl.ReceiptPubDt" /></th> <!-- 영수증 발행일자 -->
                                <td class="required_area">
                                    <input type="text" id="sReceiptStDt" name="sReceiptStDt" value="" class="form_comboBox" style="width:80px;">
                                    ~
                                    <input type="text" id="sReceiptEdDt" name="sReceiptEdDt" value="" class="form_comboBox" style="width:80px;">
                                </td>
                                <th scope="row"><spring:message code="sal.lbl.uploadDt" /></th> <!-- 업로드 일자 -->
                                <td class="required_area">
                                    <input type="text" id="sUploadStDt" name="sUploadStDt" value="" class="form_comboBox" style="width:80px;">
                                    ~
                                    <input type="text" id="sUploadEdDt" name="sUploadEdDt" value="" class="form_comboBox" style="width:80px;">
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <br>
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
                        <button type="button" class="btn_s btn_search" id="btnSearch" ><spring:message code='global.btn.scan' /><!-- 스캔 --></button>
                        <button type="button" class="btn_s btn_save" id="btnSave" ><spring:message code='global.btn.submit' /><!-- 제출 --></button>
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
                            <col style="width:10%;">
                            <col style="width:12%;">
                            <col style="width:8%;">
                            <col style="width:10%;">
                        </colgroup>
                        <tbody>
                            <tr>
                                <th scope="row"><spring:message code="sal.lbl.ReceiptNo" /></span></th> <!-- 영수증 번호 -->
                                <td class="required_area">
                                    <input id="sReceiptNo" name="sReceiptNo" type="text" value="" readonly class="form_input">
                                </td>
                                <th scope="row"><spring:message code="sal.lbl.ReceiptPubDt" /></th> <!-- 영수증 발행일-->
                                <td class="required_area">
                                    <input type="text" id="rReceiptStDt" name="sReceiptStDt" value="" class="form_comboBox" style="width:80px;">
                                    ~
                                    <input type="text" id="rReceiptEdDt" name="sReceiptEdDt" value="" class="form_comboBox" style="width:80px;">
                                </td>
                                <th scope="row"><spring:message code="sal.lbl.PurchaseCom" /></th> <!-- 구입처 -->
                                <td class="required_area">
                                    <input type="text" id="sPurchaseCom" name="sPurchaseCom" value="" class="form_input" />
                                </td>
                                <th scope="row"></th>
                                <td class="required_area"></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <br>
                <div class="table_info table_info">
                <OBJECT classid="clsid:9920E453-32A0-440A-8E57-38D03B5E7094" id="objBillOcr" width="0" height="0"></OBJECT>
                <form name="IDScanRecog">
                <input type="hidden" name="UserID" value="0000FFAE4653FD7BBDC0">
                <input type="hidden" name="BillType" value="1">
                <input type="hidden" name="result">
                <!-- <textarea name="result" style="height: 327px; width: 590px; margin-left: 0px; margin-top: 0px" ></textarea> -->
                <div class="workProgress_btnArea2 clfix">
                    <div class="inbox">
                        <div class="top_area">
                            <p class="top_txt"><spring:message code="sal.lbl.ScanInfo" /></p>
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
                                            <th scope="col"><spring:message code='sal.lbl.targFilePathNm' /></th>
                                            <td><input type="text" name="FileImgDir" style="width:100%;background-color:transparent;text-align:left;border-style:none;"></td>
                                        </tr>
                                        <tr>
                                            <th scope="row"><spring:message code='sal.lbl.ReceiptPubDt' /></th>
                                            <td><input type="text" name="ReceiptPubDt" style="width:100%;background-color:transparent;text-align:left;border-style:none;"></td>
                                        </tr>
                                        <tr>
                                            <th scope="row"><spring:message code='sal.lbl.ReceiptCd' /></th>
                                            <td><input type="text" name="RcptCd" style="width:100%;background-color:transparent;text-align:left;border-style:none;"></td>
                                        </tr>
                                        <tr>
                                            <th scope="row"><spring:message code='sal.lbl.rcptNo' /></th>
                                            <td><input type="text" name="RcptNo" style="width:100%;background-color:transparent;text-align:left;border-style:none;"></td>
                                        </tr>
                                        <tr>
                                            <th scope="row"><spring:message code='sal.lbl.PurchaseComInfo' /></th>
                                            <td><input type="text" name="CustInfo" style="width:100%;background-color:transparent;text-align:left;border-style:none;"></td>
                                        </tr>
                                        <tr>
                                            <th scope="row"><spring:message code='sal.lbl.OrgCd' /></th>
                                            <td><input type="text" name="OrgCd" style="width:100%;background-color:transparent;text-align:left;border-style:none;"></td>
                                        </tr>
                                        <tr>
                                            <th scope="row"><spring:message code='sal.lbl.CarType' /></th>
                                            <td><input type="text" name="CarType" style="width:100%;background-color:transparent;text-align:left;border-style:none;"></td>
                                        </tr>
                                        <tr>
                                            <th scope="row"><spring:message code='sal.lbl.FacModelNm' /></th>
                                            <td><input type="text" name="FacModelNm" style="width:100%;background-color:transparent;text-align:left;border-style:none;"></td>
                                        </tr>
                                        <tr>
                                            <th scope="row"><spring:message code='sal.lbl.MakingArea' /></th>
                                            <td><input type="text" name="MakingArea" style="width:100%;background-color:transparent;text-align:left;border-style:none;"></td>
                                        </tr>
                                        <tr>
                                            <th scope="row"><spring:message code='sal.lbl.certNo' /></th>
                                            <td><input type="text" name="CertNo" style="width:100%;background-color:transparent;text-align:left;border-style:none;"></td>
                                        </tr>
                                        <tr>
                                            <th scope="row"><spring:message code='sal.lbl.engNo' /></th>
                                            <td><input type="text" name="EngNo" style="width:100%;background-color:transparent;text-align:left;border-style:none;"></td>
                                        </tr>
                                        <tr>
                                            <th scope="row"><spring:message code='sal.lbl.carVinNo' /></th>
                                            <td><input type="text" name="ScanVinNo" style="width:100%;background-color:transparent;text-align:left;border-style:none;"></td>
                                        </tr>
                                        <tr>
                                            <th scope="row"><spring:message code='sal.lbl.TaxIncludeSumAmtNum' /></th>
                                            <td><input type="text" name="TaxIncludPriceNum" style="width:100%;background-color:transparent;text-align:left;border-style:none;"></td>
                                        </tr>
                                        <tr>
                                            <th scope="row"><spring:message code='sal.lbl.TaxIncludeSumAmtCrt' /></th>
                                            <td><input type="text" name="TaxIncludPriceCrt" style="width:100%;background-color:transparent;text-align:left;border-style:none;"></td>
                                        </tr>
                                        <tr>
                                            <th scope="row"><spring:message code='sal.lbl.ImportCertNo' /></th>
                                            <td><input type="text" name="ImportCertNo" style="width:100%;background-color:transparent;text-align:left;border-style:none;"></td>
                                        </tr>
                                        <tr>
                                            <th scope="row"><spring:message code='sal.lbl.ChkProductDocNo' /></th>
                                            <td><input type="text" name="ChkProductDocNo" style="width:100%;background-color:transparent;text-align:left;border-style:none;"></td>
                                        </tr>
                                        <tr>
                                            <th scope="row"><spring:message code='sal.lbl.SalesComNm' /></th>
                                            <td><input type="text" name="SalesCompanyNm" style="width:100%;background-color:transparent;text-align:left;border-style:none;"></td>
                                        </tr>
                                        <tr>
                                            <th scope="row"><spring:message code='sal.lbl.productCd' /></th>
                                            <td><input type="text" name="PrdtCd" style="width:100%;background-color:transparent;text-align:left;border-style:none;"></td>
                                        </tr>
                                        <tr>
                                            <th scope="row"><spring:message code='sal.lbl.CopyDocNum' /></th>
                                            <td><input type="text" name="CopyDocNum" style="width:100%;background-color:transparent;text-align:left;border-style:none;"></td>
                                        </tr>
                                        <tr>
                                            <th scope="row"><spring:message code='sal.lbl.PayTaxPinNo' /></th>
                                            <td><input type="text" name="PayTaxPinNo" style="width:100%;background-color:transparent;text-align:left;border-style:none;"></td>
                                        </tr>
                                        <tr>
                                            <th scope="row"><spring:message code='sal.lbl.MachineCd' /></th>
                                            <td><input type="text" name="MachineCd" style="width:100%;background-color:transparent;text-align:left;border-style:none;"></td>
                                        </tr>
                                        <tr>
                                            <th scope="row"><spring:message code='global.lbl.vinNo' /></th>
                                            <td><input type="text" name="PayVinNo" style="width:100%;background-color:transparent;text-align:left;border-style:none;"></td>
                                        </tr>
                                        <tr>
                                            <th scope="row"><spring:message code='sal.lbl.publsNm' /></th>
                                            <td><input type="text" name="ReceiptPubOrg" style="width:100%;background-color:transparent;text-align:left;border-style:none;"></td>
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
                            <img id="ScanImageView" src="" style="width:100%;height:553px; display:block;">
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

$(document).ready(function() {

    $("#mainTab").kendoExtTabStrip({
        animation:false
        , select:function(e) {

            var selectTabId = e.item.id;

            if (selectTabId === "addtaxReceiptMgmt") {                // 부가세 영수증 관리
                $("#addtaxReceiptMgmtGrid").data("kendoExtGrid").dataSource.page(1);
            } else if (selectTabId === "addtaxReceiptUpload") {       // 부가세 영수증 업로드
                //$("#fileGrid").data("kendoExtGrid").dataSource.page(1);
            };

        }
    });

    $("#sReceiptStDt").kendoDatePicker({
        value:"${sysdate}"
        ,format:"yyyyMMdd"
        ,parseFormats:["yyyyMMdd"]
    });

    $("#sReceiptStDt").kendoMaskedTextBox({
        mask:"########"
    });

    $("#sReceiptEdDt").kendoDatePicker({
        value:"${sysdate}"
        ,format:"yyyyMMdd"
        ,parseFormats:["yyyyMMdd"]
    });

    $("#sReceiptEdDt").kendoMaskedTextBox({
        mask:"########"
    });

    $("#sUploadStDt").kendoDatePicker({
        value:"${sysdate}"
        ,format:"yyyyMMdd"
        ,parseFormats:["yyyyMMdd"]
    });

    $("#sUploadStDt").kendoMaskedTextBox({
        mask:"########"
    });

    $("#sUploadEdDt").kendoDatePicker({
        value:"${sysdate}"
        ,format:"yyyyMMdd"
        ,parseFormats:["yyyyMMdd"]
    });

    $("#sUploadEdDt").kendoMaskedTextBox({
        mask:"########"
    });
    
    $("#rReceiptStDt").kendoDatePicker({
        value:"${sysdate}"
        ,format:"yyyyMMdd"
        ,parseFormats:["yyyyMMdd"]
    });

    $("#rReceiptStDt").kendoMaskedTextBox({
        mask:"########"
    });

    $("#rReceiptEdDt").kendoDatePicker({
        value:"${sysdate}"
        ,format:"yyyyMMdd"
        ,parseFormats:["yyyyMMdd"]
    });

    $("#rReceiptEdDt").kendoMaskedTextBox({
        mask:"########"
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

    $("#sReceiptStDt").val(leadingZeros(now.getFullYear(), 4) + leadingZeros(now.getMonth()+1, 2) + leadingZeros(now.getDate(), 2));
    $("#sReceiptEdDt").val(leadingZeros(now.getFullYear(), 4) + leadingZeros(now.getMonth()+1, 2) + leadingZeros(now.getDate(), 2));

    $("#sUploadStDt").val(leadingZeros(now.getFullYear(), 4) + leadingZeros(now.getMonth()+1, 2) + leadingZeros(now.getDate(), 2));
    $("#sUploadEdDt").val(leadingZeros(now.getFullYear(), 4) + leadingZeros(now.getMonth()+1, 2) + leadingZeros(now.getDate(), 2));
    
    $("#rReceiptStDt").val(leadingZeros(now.getFullYear(), 4) + leadingZeros(now.getMonth()+1, 2) + leadingZeros(now.getDate(), 2));
    $("#rReceiptEdDt").val(leadingZeros(now.getFullYear(), 4) + leadingZeros(now.getMonth()+1, 2) + leadingZeros(now.getDate(), 2));

    // 조회
    $("#btnSearch").kendoButton({
        click:function(e) {
            $('#addtaxReceiptMgmtGrid').data('kendoExtGrid').dataSource.page(1);
           }
    });
 
    // 영수증 관리 그리드 시작
    $("#addtaxReceiptMgmtGrid").kendoExtGrid({
        gridId:"G-SAL-0217-170911"
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
                        params["sReceiptStDt"] = $("#sReceiptStDt").val();
                        params["sReceiptEdDt"] = $("#sReceiptEdDt").val();
                        params["sUploadStDt"] = $("#sUploadStDt").val();
                        params["sUploadEdDt"] = $("#sUploadEdDt").val();

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
                        ,receiptNo:{type:"string", editable:false }
                        ,receiptIssDt:{type:"string", editable:false }
                        ,uploadDt:{type:"string", editable:false }
                        ,buyNm:{type:"string", editable:false }
                        ,texpayerIdCd:{type:"string", editable:false }
                        ,sumAmt:{type:"string", editable:false }
                        ,taxAmt:{type:"string", editable:false }
                        ,carlineNm:{type:"string", editable:false }
                        ,modelNm:{type:"string", editable:false }
                        ,retlPrc:{type:"string", editable:false}
                        ,extColorNm:{type:"string", editable:false}
                        ,dlrCd:{type:"string", editable:false}
                        ,custSaleDt:{type:"string", editable:false}
                        ,receiptImg:{type:"string", editable:false}
                    }
                }
            }
        }
        ,height:550
        ,navigatable:false
        ,pageable:false
        ,selectable:"row"
        , indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
        , indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
        , multiSelectWithCheckbox:false     //멀티선택 적용. default:false
        , appendEmptyColumn:true           //빈컬럼 적용. default:false
        , enableTooltip:true               //Tooltip 적용, default:false
        ,columns:[
             {field:"receiptNo", title:"<spring:message code='sal.lbl.rcptNo' />", width:80 }                /* 영수증번호 */
            ,{field:"receiptIssDt", title:"<spring:message code='sal.lbl.ReceiptPubDt' />", width:100 }      /* 영수증발행일자 */
            ,{field:"uploadDt", title:"<spring:message code='sal.lbl.uploadDt' />", width:100 }              /* 업로드일자 */
            ,{field:"buyNm", title:"<spring:message code='sal.lbl.PurchaseCom' />", width:100 }              /* 구입처 */
            ,{field:"texpayerIdCd", title:"<spring:message code='sal.lbl.PayTaxPinNo' />", width:150 }       /* 납세자식별번호 */
            ,{field:"texpayerIdCd", title:"<spring:message code='sal.lbl.SgradeNwIden' />", width:150}       /* 2급망표식 */
            ,{field:"vinNo", title:"<spring:message code='sal.lbl.carVinNo' />", width:150}                  /* VIN */
            ,{field:"sumAmt", title:"<spring:message code='sal.lbl.PublishAmt' />", width:100}               /* 발행금액 */
            ,{field:"taxAmt", title:"<spring:message code='sal.lbl.vatAmt' />", width:100}                   /* 발행세액 */
            ,{field:"carlineNm", title:"<spring:message code='ser.lbl.carLine' />", width:100}               /* 차종 */
            ,{field:"modelNm", title:"<spring:message code='global.lbl.model' />", width:150}                /* 모델 */
            ,{field:"retlPrc", title:"<spring:message code='sal.lbl.guideAmt' />", width:100}                /* 지도가격 */
            ,{field:"extColorNm", title:"<spring:message code='sal.lbl.extColor' />", width:100}             /* 외색 */
            ,{field:"dlrCd", title:"<spring:message code='global.lbl.dlrCd' />", width:100}                  /* 딜러코드 */
            ,{field:"custSaleDt", title:"<spring:message code='sal.lbl.custSaleDt' />", width:100}           /* 출고일자 */
            ,{field:"receiptImg", title:"<spring:message code='sal.lbl.RcptImage' />", width:100}            /* 영수증이미지 */
        ]
    });
    // 영수증 관리 그리드 종료

});

//billOcr.OCX 관련 정보 시작

nResult = -1;
strResult = "";
strImageName = "";

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

var fileNmDt = leadingZeros(now.getFullYear(), 4) + leadingZeros(now.getMonth()+1, 2) + leadingZeros(now.getDate(), 2);
var fileNmTm = leadingZeros(now.getHours(), 2) + leadingZeros(now.getMinutes(), 2) + leadingZeros(now.getSeconds(), 2);
var imgFileNm = fileNmDt+fileNmTm;

function LoadRecogKenal() {
    document.IDScanRecog.result.innerText = "";
    nResult = objBillOcr.InitRecogForm(document.IDScanRecog.UserID.value);
    if (nResult == 0) {
        document.IDScanRecog.result.innerText = "뵙懃속潼냥묘";
    }
    else {
        document.IDScanRecog.result.innerText = "뵙懃속潼呵겨\r\n럿쀼令：";
        document.IDScanRecog.result.innerText += nResult;
    }
}

function FreeRecogKenal()
{
    objBillOcr.UninitRecogForm();
    document.IDScanRecog.result.innerText = "뵙懃綠쒔姦렴";
}

function RecognizeImg() {

    LoadRecogKenal();
    document.IDScanRecog.result.innerText = "";

        objBillOcr.SetFormTypes(document.IDScanRecog.BillType.value, 1);
        objBillOcr.SetDeviceAdvancedParams(6,0);
        objBillOcr.SetDeviceAdvancedParams(10,10);

        var Path = "c:\\ScanInfoImage\\";
        var index = imgFileNm;
        var strEx = ".jpg";
        var ImagePath;
        var bHavePaper = 1;

        while(bHavePaper)
        {
            index++;
            ImagePath = Path + index + strEx;
            nResult = objBillOcr.AcquireNewImage(ImagePath);

            nResult = objBillOcr.RecognizeForm();
            if (nResult == 0)
            {
                strImageName = ImagePath;
                GetResult();
            }
            else {
                strResult = strImageName;
                strResult = nResult + "\r\n";
            }
            document.IDScanRecog.result.innerText.value = strResult;
            bHavePaper = objBillOcr.IsHavePaper();
        }

}

function UpLoadFile() {

    var strServerAdd = document.IDScanRecog.ServerAdd.value;
    var strFileName = document.IDScanRecog.LocalFileName.value;
    var UpLoadReturn = objBillOcr.UpLoadFile(strServerAdd, strFileName);
    if (0 == UpLoadReturn) {
        document.IDScanRecog.result.innerText = "匡숭:" + strFileName + "눈냥묘!";
    }
    else {
        document.IDScanRecog.result.innerText = "匡숭:" + strFileName + "눈呵겨！\r\n댄轎덜쯤:";
        document.IDScanRecog.result.innerText += UpLoadReturn;
    }
}

function DeleteFile() {
    var strFileName = document.IDScanRecog.LocalFileName.value;
    var DeleteCode = objBillOcr.DeleteFile(strFileName);
    if (0 == DeleteCode) {
        document.IDScanRecog.result.innerText = "匡숭:" + strFileName + "뇜냥묘！";
    }
    else {
        document.IDScanRecog.result.innerText = "匡숭:" + strFileName + "뇜呵겨！\r\n댄轎덜쯤:";
        document.IDScanRecog.result.innerText += DeleteCode;
    }

}

function GetResult() {
    //var recogResult = strImageName + " 췄街깎냥묘\r\n";
    var recogResult = strImageName;
    strResult += recogResult;
    var nFieldNum = objBillOcr.GetRecogCellCount();
    if (nFieldNum > 0) {
        for (var i = 0; i < nFieldNum; ++i) {
            strResult += objBillOcr.GetFieldName(i);
            strResult += ":";
            strResult += objBillOcr.GetRecognizeResult(i);
            strResult += "\r\n";
        }
        document.IDScanRecog.result.innerText = strResult;
        document.IDScanRecog.FileImgDir.value= recogResult;  <!-- 로컬 이미지 경로 -->
        document.IDScanRecog.ReceiptPubDt.value= objBillOcr.GetRecognizeResult(0);  <!-- 영수증 발행일자 -->
        document.IDScanRecog.RcptCd.value= objBillOcr.GetRecognizeResult(1);  <!-- 영수증코드 -->
        document.IDScanRecog.RcptNo.value= objBillOcr.GetRecognizeResult(2);  <!-- 영수증번호 -->
        document.IDScanRecog.CustInfo.value= objBillOcr.GetRecognizeResult(3);  <!-- 구입회사사람 -->
        document.IDScanRecog.OrgCd.value= objBillOcr.GetRecognizeResult(4);  <!-- 기관코드 -->
        document.IDScanRecog.CarType.value= objBillOcr.GetRecognizeResult(5);  <!-- 차량유형 -->
        document.IDScanRecog.FacModelNm.value= objBillOcr.GetRecognizeResult(6);  <!-- 창패형호 -->
        document.IDScanRecog.MakingArea.value= objBillOcr.GetRecognizeResult(7);  <!-- 제조지 -->
        document.IDScanRecog.CertNo.value= objBillOcr.GetRecognizeResult(8);  <!-- 합격증번호 -->
        document.IDScanRecog.EngNo.value= objBillOcr.GetRecognizeResult(9);  <!-- 엔진번호 -->
        document.IDScanRecog.ScanVinNo.value= objBillOcr.GetRecognizeResult(10);  <!-- VIN -->
        document.IDScanRecog.TaxIncludPriceNum.value= objBillOcr.GetRecognizeResult(11);  <!-- 세금포함합계금액숫자 -->
        document.IDScanRecog.ImportCertNo.value= objBillOcr.GetRecognizeResult(12);  <!-- 수입증명서번호 -->
        document.IDScanRecog.ChkProductDocNo.value= objBillOcr.GetRecognizeResult(13);  <!-- 상품검사문서번호 -->
        document.IDScanRecog.TaxIncludPriceCrt.value= objBillOcr.GetRecognizeResult(14);  <!-- 세금포함합계금액문자 -->
        document.IDScanRecog.SalesCompanyNm.value= objBillOcr.GetRecognizeResult(15);  <!-- 판매회사명칭 -->
        document.IDScanRecog.PrdtCd.value= objBillOcr.GetRecognizeResult(16);  <!-- 상품코드 -->
        document.IDScanRecog.CopyDocNum.value= objBillOcr.GetRecognizeResult(17);  <!-- 복사본 -->
        document.IDScanRecog.PayTaxPinNo.value= objBillOcr.GetRecognizeResult(18);  <!-- 납세자식별번호 -->
        document.IDScanRecog.MachineCd.value= objBillOcr.GetRecognizeResult(21);  <!-- 발동기 -->
        document.IDScanRecog.PayVinNo.value= objBillOcr.GetRecognizeResult(24);  <!-- 영수증 VIN -->
        document.IDScanRecog.ReceiptPubOrg.value= objBillOcr.GetRecognizeResult(25);  <!-- 영수증발행자 -->

        document.getElementById("ScanImageView").src = recogResult;

     }
}

function SelectMod()
{
    var s = document.getElementById("fileMod");
    s.click();
    var strModPath = s.value;
    document.IDScanRecog.ModPath.value = strModPath;
    var nRet = objBillOcr.LoadTemplates(strModPath);
    if(nRet == 0)
    {
        document.IDScanRecog.result.innerText = "돔흙친겼냥묘";
    }else
    {
        document.IDScanRecog.result.innerText =  "돔흙친겼呵겨";
    }
}

function LoadRecog()
{
    var nSet = objBillOcr.SetFormTypes(document.IDScanRecog.BillType.value, 1);
    if(nSet != 0)
    {
        document.IDScanRecog.result.innerText =  "零친겼呵겨";
    }else
    {
        var fd = new ActiveXObject("MSComDlg.CommonDialog");
            fd.Filter = "All Files (*.*)";
            fd.FilterIndex = 2;
            fd.MaxFileSize = 128;
            fd.ShowOpen();
        var ImageName = fd.FileName;
        document.IDScanRecog.ModPath.value = fd.FileName;
        var nRet = objBillOcr.LoadImages(ImageName );
        if(nRet == 0)
        {
                 alert("돔흙暠獗냥묘！");
        }else
        {
                  alert("돔흙暠獗呵겨！");
        }
            var nResult = objBillOcr.RecognizeForm();
        if(nResult == 0)
        {
            strImageName = ImageName;

                GetResult();
        }else
        {
                    alert("街깎暠獗呵겨！");
        }
    }
}

function RecognizeBar()
{
        var s = document.getElementById("fileCode");
        s.click();
        var strImgPath = s.value;
        document.IDScanRecog.LocalImageName.value = strImgPath;
        var nRet = objBillOcr.LoadImages(document.IDScanRecog.LocalImageName.value);
        if(nRet == 0)
        {
            var nCellCount = objBillOcr.RecognizeBarcode(0);
            if(nCellCount > 0)
            {
                var recogResult = strImageName + " 街깎냥묘\r\n";
                        strResult += recogResult;
                        var nFieldNum = objBillOcr.GetRecogCellCount();
                        if (nFieldNum > 0)
                        {
                            for (var i = 0; i < nFieldNum; ++i)
                            {
                                strResult += objBillOcr.GetFieldName(i);
                                strResult += ":";
                                strResult += objBillOcr.GetRecognizeResult(i);
                                strResult += "\r\n";
                            }
                            document.IDScanRecog.result.innerText = strResult;
                        }
            }else
                document.IDScanRecog.result.innerText = "暠獗꼇닸瞳係近쯤";
        }else
             alert("돔흙暠獗呵겨！");

}
// billOcr.OCX 관련 정보 끝
</script>



<!-- [DMS] 부가세영수증관리 -->
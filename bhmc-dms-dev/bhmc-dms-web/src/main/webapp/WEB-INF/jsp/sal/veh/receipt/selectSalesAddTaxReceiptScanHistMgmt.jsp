<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<%--
    JSP Name : selectSalesAddTaxReceiptScanHistMgmt.jsp
    Description : 기준정보 > 부가세영수증스캔이력관리
    author chibeom.song
    since 2017. 2. 17.
    version 1.0
    Modification Information
       since          author              description
    ===========    =============    ===========================
    2017. 2. 17.   chibeom.song     최초 생성
--%>

<!-- [DMS] 부가세영수증스캔이력관리 -->
<div id="resizableContainer">
<section class="group" >
    <!-- 조회 조건 타이틀 시작 -->
    <div class="header_area">
        <h1 class="title_basic"><spring:message code="sal.title.ReceiptScanHistMgmt" /></h1><!-- 영수증스캔이력관리 -->
        <div class="btn_right">
            <dms:access viewId="VIEW-D-12807" hasPermission="${dms:getPermissionMask('READ')}">
            <button class="btn_m btn_search" id="btnSearch"><spring:message code="global.btn.search" /></button><!-- 조회 -->
            </dms:access>
        </div>
    </div>
    <!-- 조회 조건 타이틀 종료 -->

    <!-- 조회 조건 시작 -->
    <div class="table_form form_width_100per" role="search" data-btnid="btnSearch">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:10%;">
                <col style="width:24%;">
                <col style="width:10%;">
                <col style="width:23%;">
                <col style="width:10%;">
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><spring:message code="sal.lbl.uploadDt" /></th><!-- 업로드일자 -->
                    <td>
                        <input type="text" id="sUploadStDt" name="sUploadStDt" value="" class="form_comboBox" style="width:80px;">
                        ~
                        <input type="text" id="sUploadEdDt" name="sUploadEdDt" value="" class="form_comboBox" style="width:80px;">
                    </td>
                    <th scope="row"><spring:message code="sal.lbl.rcptNo" /></th><!-- 영수증 번호 -->
                    <td>
                        <input id="sReceiptNo" name="sReceiptNo" class="form_input">
                    </td>
                    <th scope="row"><spring:message code="sal.lbl.PayTaxPinNo" /></th><!-- 납세자식별번호 -->
                    <td>
                        <input id="sTaxpayerIdCd" name="sTaxpayerIdCd" class="form_input">
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
    <!-- 조회 조건 종료 -->

    <!-- 그리드 시작 -->
    <div class="table_grid mt10">
        <div id="grid" class="resizable_grid"></div>
    </div>
    <!-- 그리드 종료 -->

</section>
</div>

<script type="text/javascript">

$(document).ready(function() {

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
    
    $("#sUploadStDt").val(leadingZeros(now.getFullYear(), 4) + leadingZeros(now.getMonth()+1, 2) + leadingZeros(now.getDate(), 2));
    $("#sUploadEdDt").val(leadingZeros(now.getFullYear(), 4) + leadingZeros(now.getMonth()+1, 2) + leadingZeros(now.getDate(), 2));
    
    // 조회
    $("#btnSearch").kendoButton({
        click:function(e) {
            $('#grid').data('kendoExtGrid').dataSource.page(1);
           }
    });
    
    // 부가세영수증스캔이력관리 그리드 시작
    $("#grid").kendoExtGrid({
        gridId:"G-SAL-0217-183009"
        ,dataSource:{
             transport:{
                read:{
                    url:"<c:url value='/sal/veh/receipt/selectSalesAddTaxReceiptScanHistMgmtSearch.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};

                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;
                        
                        params["sUploadStDt"] = $("#sUploadStDt").val();
                        params["sUploadEdDt"] = $("#sUploadEdDt").val();
                        params["sTaxpayerIdCd"] = $("#sTaxpayerIdCd").val();
                        params["sReceiptNo"] = $("#sReceiptNo").val();

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
                         dlrCd:{type:"string", editable:false }
                        ,upDt:{type:"string", editable:false }
                        ,receiptNo:{type:"string", editable:false }
                        ,receiptType:{type:"string", editable:false }
                        ,vinNo:{type:"string", editable:false }
                        ,vinNo1:{type:"string", editable:false }
                        ,vinNo2:{type:"string", editable:false }
                        ,taxpayerIdCd:{type:"string", editable:false }
                        ,receiptCd:{type:"string", editable:false }
                        ,receiptCustNm:{type:"string", editable:false }
                        ,ssnCrnNo:{type:"string", editable:false}
                        ,receiptIssDt:{type:"string", editable:false}
                        ,scanVinNo:{type:"string", editable:false}
                        ,sumAmt:{type:"string", editable:false}
                        ,certNo:{type:"string", editable:false}
                        ,engnNo:{type:"string", editable:false}
                        ,sumIncTax:{type:"string", editable:false}
                        ,sumExcTax:{type:"string", editable:false}
                        ,taxRt:{type:"string", editable:false}
                        ,taxAmt:{type:"string", editable:false}
                        ,merchNm:{type:"string", editable:false}
                        ,custAddr:{type:"string", editable:false}
                        ,tmrCd:{type:"string", editable:false}
                        ,regUsrId:{type:"string", editable:false}
                        ,regDt:{type:"string", editable:false}
                        ,custSaleDt:{type:"string", editable:false}
                    }
                }
            }
        }
        ,navigatable:false
        ,pageable:false
        ,selectable:"row"
        ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
        ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
        ,multiSelectWithCheckbox:false    //멀티선택 적용. default:false
        ,appendEmptyColumn:true           //빈컬럼 적용. default:false
        ,enableTooltip:true               //Tooltip 적용, default:false
        ,columns:[
             {field:"upDt", title:"<spring:message code='sal.lbl.uploadDt' />", width:150 }                /* 업로드일자 */
            ,{field:"receiptNo", title:"<spring:message code='sal.lbl.ReceiptNo' />", width:150 }          /* 영수증번호 */
            ,{field:"sumIncTax", title:"<spring:message code='sal.lbl.PublishAmt' />", width:150 }         /* 발행금액 */
            ,{field:"taxAmt", title:"<spring:message code='sal.lbl.vatAmt' />", width:150 }                /* 발행세액 */
            ,{field:"taxpayerIdCd", title:"<spring:message code='sal.lbl.PayTaxPinNo' />", width:150 }     /* 식별번호 */
        ]
    });
    // 부가세영수증스캔이력관리 그리드 종료

});


</script>
<!-- [DMS] 부가세영수증스캔이력관리 -->
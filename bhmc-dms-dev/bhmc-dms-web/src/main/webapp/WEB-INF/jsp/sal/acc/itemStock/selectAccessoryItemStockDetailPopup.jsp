<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<section class="pop_wrap">
    <div class="header_area">
        <div class="btn_right">
            <dms:access viewId="VIEW-D-12845" hasPermission="${dms:getPermissionMask('READ')}">
            <button id="btnSave" class="btn_m btn_save"><spring:message code="global.btn.save" /><!-- 저장 --></button>
            </dms:access>
            <dms:access viewId="VIEW-D-12844" hasPermission="${dms:getPermissionMask('READ')}">
            <button id="btnCancel" class="btn_m btn_cancel"><spring:message code="global.btn.cancel" /><!-- 취소 --></button>
            </dms:access>
        </div>
    </div>

    <form id="itemStockForm">
    <div class="table_form">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:10%;">
                <col style="width:24%;">
                <col style="width:10%;">
                <col style="width:23%;">
                <col style="width:10%;">
                <col>
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><spring:message code="sal.lbl.goodsCd" /><!-- 용품코드 --></th>
                    <td>
                        <input type="text" id="itemCd" name="itemCd" class="form_input" disabled pattern="[A-Z0-9\-]+" data-name="<spring:message code='sal.lbl.goodsCd' />" data-value-update="keyup" data-bind="value:itemCd" onkeyup="this.value=this.value.toUpperCase()"/>
                    </td>
                    <th scope="row"><spring:message code="global.lbl.goodsNm" /><!-- 용품명 --></th>
                    <td>
                        <input type="text" id="itemNm" name="itemNm" class="form_input" disabled data-name="<spring:message code='global.lbl.goodsNm' />" data-bind="value:itemNm" />
                    </td>
                    <th scope="row"><spring:message code="sal.lbl.itemEnNm" /><!-- 용품영문명 --></th>
                    <td>
                        <input type="text" id="itemEnNm" name="itemEnNm" class="form_input" disabled data-name="<spring:message code='sal.lbl.itemEnNm' />" data-bind="value:itemEnNm" />
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code="sal.lbl.goodsGubun" /><!-- 용품유형 --></th>
                    <td>
                        <input type="text" id="etcCd1" name="etcCd1" class="form_comboBox" disabled data-name="<spring:message code='sal.lbl.goodsGubun' />" data-bind="value:etcCd1" />
                    </td>
                    <th scope="row"><spring:message code="sal.lbl.goodsHouse" /><!-- 용품창고 --></th>
                    <td>
                        <input type="text" id="grStrgeCd" name="grStrgeCd" class="form_comboBox" disabled data-name="<spring:message code='sal.lbl.goodsHouse' />" data-bind="value:strgeCd" />
                    </td>
                    <th scope="row"><spring:message code="sal.lbl.unit" /><!-- 단위 --></th>
                    <td>
                        <input type="text" id="stockUnitCd" name="stockUnitCd" class="form_comboBox" disabled data-name="<spring:message code='global.lbl.unitCd' />" data-bind="value:stockUnitCd" />
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code="global.lbl.brand" /><!-- 브랜드 --></th>
                    <td>
                        <input type="text" id="brandCd" name="brandCd" class="form_comboBox" disabled data-name="<spring:message code='global.lbl.brand' />" data-bind="value:brandCd" />
                    </td>
                    <th scope="row"><spring:message code="global.lbl.bpCd" /><!-- 공급업체 --></th>
                    <td>
                        <div class="form_search">
                        <input type="text" id="bpNm" name="bpNm" class="form_input" disabled data-name="<spring:message code='global.lbl.bpCd' />" data-bind="value:bpNm" />
                        <a href="javascript:void(0);"></a>
                        </div>
                    </td>
                    <th scope="row"><spring:message code="sal.lbl.prodFactory" /><!-- 생산공장 --></th>
                    <td>
                        <input type="text" id="etc1" name="etc1" class="form_input" disabled data-name="<spring:message code='sal.lbl.prodFactory' />" data-bind="value:etc1" />
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code="sal.lbl.lastGrDt" /><!-- 최근입고일 --></th>
                    <td>
                        <input type="checkbox" id="lastGrDt" name="lastGrDt" class="form_datepicker" disabled data-name="<spring:message code='sal.lbl.lastGrDt' />" data-bind="value:lastGrDt" />
                    </td>
                    <th scope="row"><spring:message code="sal.lbl.lastPurcPrc" /><!-- 최근구입가격 -> 최근구매가 --></th>
                    <td>
                        <input type="number" id="purcPrc" name="purcPrc" class="form_numeric ar" disabled data-name="<spring:message code='sal.lbl.lastPurcPrc' />" data-bind="value:purcPrc" />
                    </td>
                    <th scope="row"><spring:message code="sal.lbl.movingAvgPrc" /><!-- 재고원가 --></th>
                    <td>
                        <input type="number" id="movingAvgPrc" name="movingAvgPrc" class="form_numeric ar" disabled data-name="<spring:message code='sal.lbl.movingAvgPrc' />" data-bind="value:movingAvgPrc" />
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code="sal.lbl.stockAmt" /><!-- 재고금액 --></th>
                    <td>
                        <input type="number" id="stockAmt" name="stockAmt" class="form_numeric ar" disabled data-name="<spring:message code='sal.lbl.stockAmt' />" data-bind="value:stockAmt" />
                    </td>
                    <th scope="row"><spring:message code="sal.lbl.fitCost" /><!-- 설치비 --></th>
                    <td>
                        <input type="number" id="etc2" name="etc2" class="form_numeric ar" disabled data-name="<spring:message code='sal.lbl.fitCost' />" data-bind="value:etc2" />
                    </td>
                    <th scope="row"><spring:message code="sal.lbl.avlbStockQty" /><!-- 가용수량 --></th>
                    <td>
                        <input type="number" id="avlbStockQty" name="avlbStockQty" class="form_numeric ar" disabled data-name="<spring:message code='sal.lbl.avlbStockQty' />" data-bind="value:avlbStockQty" />
                    </td>
                </tr>                
                <tr>
                    <th scope="row"></th>
                    <td></td>
                    <th scope="row"></th>
                    <td></td>
                    <th scope="row"><spring:message code="sal.lbl.salePrice" /><!-- 판매가 --></th>
                    <td>
                        <input type="number" id="retlPrc" name="retlPrc" class="form_numeric ar" data-name="<spring:message code='sal.lbl.salePrice' />" data-bind="value:retlPrc" />
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
    <span style="display:none">
        <!-- 판매가세금비율 -->
        <input type="number" id="retlAddTaxRate" name="retlAddTaxRate" class="form_numeric ar" data-name="<spring:message code='sal.lbl.retlAddTaxRate' />" data-bind="value:retlAddTaxRate" />
        <!-- 판매가(세금불포함) -->
        <input type="number" id="taxDdctRetlPrc" name="taxDdctRetlPrc" class="form_numeric ar" data-name="<spring:message code='sal.lbl.taxDdctRetlPrc' />" data-bind="value:taxDdctRetlPrc" />
    </span>
    </form>
</section>

<script type="text/javascript">
var viewModel = new kendo.observable({
    "dlrCd":"${itemStock.dlrCd}"                    //딜러코드  o
    ,"pltCd":"${itemStock.pltCd}"                   //플랜트코드 o
    ,"spyrCd":"${itemStock.spyrCd}"                 //공급상구분 o
    ,"itemCd":"${itemStock.itemCd}"                 //용품코드 o
    ,"itemNm":"${itemStock.itemNm}"                 //용품명 o
    ,"brandCd":"${itemStock.brandCd}"               //브랜드 
    ,"etcCd1":"${itemStock.etcCd1}"                 //용품유형
    ,"itemEnNm":"${itemStock.itemEnNm}"             //용품영문명
    ,"stockUnitCd":"${itemStock.stockUnitCd}"       //재고단위
    ,"bpCd":"${itemStock.bpCd}"                     //공급업체코드
    ,"bpNm":"${itemStock.bpNm}"                     //공급업체명
    ,"etc1":"${itemStock.etc1}"                     //생산공장
    ,"etc2":"${itemStock.etc2}"                     //설치비
    ,"strgeCd":"${itemStock.strgeCd}"               //창고코드
    ,"purcPrc":"${itemStock.purcPrc}"               //최근구입가
    ,"avlbStockQty":"${itemStock.avlbStockQty}"     //가용수량
    ,"movingAvgPrc":"${itemStock.movingAvgPrc}"     //재고원가
    ,"stockAmt":"${itemStock.stockAmt}"             //재고금액
    ,"retlPrc":"${itemStock.retlPrc}"               //판매가(소매가)
    ,"taxDdctRetlPrc":"${itemStock.taxDdctRetlPrc}" //판매가(세금불포함)(세금공제소매가)
    ,"retlAddTaxRate":"${itemStock.retlAddTaxRate}" //세금비율(소매가세금비율)
    ,"lastGrDt":kendo.parseDate("<fmt:formatDate pattern='yyyy-MM-dd' value='${itemStock.lastGrDt}' />", "yyyy-MM-dd")  //최근입고일
});

//용품유형 목록
var etcCd1List = [];
<c:forEach var="obj" items="${etcCd1List}">
etcCd1List.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

//재고단위 목록
var stockUnitCdList = [];
<c:forEach var="obj" items="${stockUnitCdList}">
stockUnitCdList.push({"cmmCd":"${obj.unitExtCd}", "cmmCdNm":"${obj.unitExtCd}"});
</c:forEach>

//브랜드 목록
var brandCdList = [];
<c:forEach var="obj" items="${brandCdList}">
brandCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

//용품창고 목록
var storageList = [];
<c:forEach var="obj" items="${storageList}">
storageList.push({"strgeCd":"${obj.strgeCd}", "strgeNm":"${obj.strgeNm}"});
</c:forEach>

$(document).ready(function() {
    //팝업옵션
    var popupWindow = parent.$("#accessoryItemStockDetailPopup").data("kendoWindow");
    var popupOptions = popupWindow.options.content.data;

    var validator = $("#itemStockForm").kendoExtValidator().data("kendoExtValidator");

    //버튼-저장
    $("#btnSave").kendoButton({
        click:function(e){

            if (validator.validate()) {
                $.ajax({
                    url:"<c:url value='/sal/acc/itemStock/insertOrUpdateAccessoryItemPrice.do' />",
                    data:JSON.stringify({
                        "dlrCd":viewModel.dlrCd
                        ,"pltCd":viewModel.pltCd
                        ,"strgeCd":viewModel.strgeCd
                        ,"itemCd":viewModel.itemCd
                        ,"retlPrc":$("#retlPrc").data("kendoExtNumericTextBox").value()
                        ,"taxDdctRetlPrc":$("#taxDdctRetlPrc").data("kendoExtNumericTextBox").value()
                        ,"retlAddTaxRate":$("#retlAddTaxRate").data("kendoExtNumericTextBox").value()
                    }),
                    type:'POST',
                    dataType:'json',
                    contentType:'application/json',
                    error:function(jqXHR,status,error) {
                        dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                    },
                    success:function(jqXHR, textStatus) {
                        //정상적으로 반영 되었습니다.
                        dms.notification.success("<spring:message code='global.info.success'/>");
                        popupOptions.callbackFunc();
                        popupWindow.close();
                    }
                });
            }
        }
    });

    //버튼-취소
    $("#btnCancel").kendoButton({
        click:function(e){
            popupWindow.close();
        }
    });

    //입력폼 - 용품유형
    $("#etcCd1").kendoExtDropDownList({
         dataSource:etcCd1List
        ,dataValueField:"cmmCd"
        ,dataTextField:"cmmCdNm"
        ,optionLabel:" "
        ,index:0
    });

    //입력폼 - 재고단위
    $("#stockUnitCd").kendoExtDropDownList({
         dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:stockUnitCdList
        ,optionLabel:" "
        ,index:0
    });

    //입력폼 - 브랜드
    $("#brandCd").kendoExtDropDownList({
         dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:brandCdList
        ,optionLabel:" "
        ,index:0
    });

    //입력폼 - 설치비
    $("#etc2").kendoExtNumericTextBox({
        format:"n2"
        ,min:0
        ,spinners:false
    });

    //입력폼 - 최근입고일
    $("#lastGrDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
    });

    //입력폼 - 용품창고
    $("#grStrgeCd").kendoExtDropDownList({
         dataTextField:"strgeNm"
        ,dataValueField:"strgeCd"
        ,dataSource:storageList
        ,optionLabel:" "
        ,index:0
    });

    //입력폼 - 최근구매가
    $("#purcPrc").kendoExtNumericTextBox({
        format:"n2"
        ,min:0
        ,spinners:false
    });

    //입력폼 - 가용수량
    $("#avlbStockQty").kendoExtNumericTextBox({
        decimals:0
        ,format:"n0"
        ,min:0
        ,spinners:false
    });

    //입력폼 - 재고원가
    $("#movingAvgPrc").kendoExtNumericTextBox({
        format:"n2"
        ,min:0
        ,spinners:false
    });

    //입력폼 - 재고금액
    $("#stockAmt").kendoExtNumericTextBox({
        format:"n2"
        ,min:0
        ,spinners:false
    });

    //입력폼 - 판매가
    $("#retlPrc").kendoExtNumericTextBox({
        format:"n2"
        ,min:0
        ,spinners:false
        ,change:function(e){
            var retlAddTaxRate = $("#retlAddTaxRate").data("kendoExtNumericTextBox").value();
            var retlPrc = this.value();

            viewModel.set("taxDdctRetlPrc", retlPrc/(1+retlAddTaxRate));
        }
    });

    //입력폼 - 판매가(세금불포함)
    $("#taxDdctRetlPrc").kendoExtNumericTextBox({
        format:"n2"
        ,min:0
        ,spinners:false
        ,change:function(e){
            var retlAddTaxRate = $("#retlAddTaxRate").data("kendoExtNumericTextBox").value();
            var taxDdctRetlPrc = this.value();

            viewModel.set("retlPrc", taxDdctRetlPrc*(1+retlAddTaxRate));
        }
    });

    //입력폼 - 판매가세금비율
    $("#retlAddTaxRate").kendoExtNumericTextBox({
        format:"n2"
        ,min:0
        ,max:1
        ,spinners:false
        ,change:function(e){
            var retlPrc = $("#retlPrc").data("kendoExtNumericTextBox").value();
            var retlAddTaxRate = this.value();

            viewModel.set("taxDdctRetlPrc", retlPrc/(1+retlAddTaxRate));
        }
    });

    kendo.bind($("#itemStockForm"), viewModel);
});
</script>

<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<!-- 용품판매 반품 팝업 -->
<section id="windows" class="pop_wrap">
    <div class="table_form mt10">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:40%;">
                <col style="width:60%;">
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><spring:message code="sal.lbl.goodsCd" /><!-- 용품번호 --></th>
                    <td>
                        <input id="goodsCd" name="goodsCd" class="form_input form_readonly" readonly/>
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code="sal.lbl.goodsNm" /><!-- 용품명 --></th>
                    <td>
                        <input id="goodsNm" name="goodsNm" class="form_input form_readonly" readonly/>
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code="par.lbl.grReturnQty" /><!-- 반품수량 --></th>
                    <td>
                        <input id="returnQty" name="returnQty" class="form_numeric ar" />
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
    <div class="btn_bottom">
        <button id="btnOk" class="btn_m btn_save"><spring:message code="sal.btn.fix" /><!-- 확정 --></button>
        <button id="btnCancel" class="btn_m btn_cancel"><spring:message code="par.btn.cancel" /><!-- 취소 --></button>
    </div>
</section>

<script type="text/javascript">
$(document).ready(function() {
    var popupWindow = parent.$("#setAccessoryItemStockOutReturnPopup").data("kendoWindow");
    var popupOptions = popupWindow.options.content.data;

    //용품코드
    $("#goodsCd").val(popupOptions.goodsCd);

    //용품명
    $("#goodsNm").val(popupOptions.goodsNm);

    //반품수량
    $("#returnQty").kendoExtNumericTextBox({
        format:"{0:n0}"
        ,max:popupOptions.avlbReturnQty
        ,min:1
        ,decimals:0
        ,restrictDecimals: true
        ,value:popupOptions.avlbReturnQty
        ,spinners:false
    });

    //버튼 -확인
    $("#btnOk").kendoButton({
        click:function(e){
             popupOptions.callbackFunc($("#returnQty").data("kendoExtNumericTextBox").value());
        }
    });

    //버튼 - 취소
    $("#btnCancel").kendoButton({
        click:function(e){
            popupWindow.close();
        }
    });
});
</script>

